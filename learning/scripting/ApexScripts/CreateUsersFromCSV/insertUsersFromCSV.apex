Map<String, SObject> recordsMap(String key, List<SObject> records) {
    Map<String, SObject> m = new Map<String,SObject>();
    for (SObject r: records) {
        m.put(String.valueOf(r.get(key)), r);
    }
    return m;
}

Map<String, SObject> profilesMap = recordsMap('Name', [SELECT Name FROM Profile]);
Map<String, SObject> rolesMap = recordsMap('Name', [SELECT Name FROM UserRole]);
Map<String, SObject> permissionsetsMap = recordsMap('Name', [SELECT Name FROM PermissionSet]);
Map<String, SObject> permissionsetgroupsMap = recordsMap('DeveloperName', [SELECT DeveloperName FROM PermissionSetGroup]);

String resourceName = 'UsersList'; // Replace with the actual name of your Static Resource
String csvBody = '';

// Retrieve the CSV file from the Static Resource
PageReference csvFile = PageReference.forResource(resourceName);
Blob csvBlob;

if (!csvFile.getURL().startsWith('/resource/')) {
    System.debug('Static Resource not found.');
} else {
    csvBlob = csvFile.getContent();
    csvBody = csvBlob.toString();
}

System.debug('csvBody: ' + csvBody);

// Parse and insert user records 

List<User> usersToInsert = new List<User>();

// Split CSV rows by line breaks
List<String> csvRows = csvBody.split('\n');

// Create array with User fields
for (Integer i = 1; i < csvRows.size(); i++) { // Skip the header row (row zero)
    List<String> csvValues = csvRows[i].split(',');

    List<User> ExistingUser = [SELECT Id FROM User WHERE Username = :csvValues[4]]; // Check if user with such username already exists
    String UsernameString = '';

    if (ExistingUser.isEmpty()) {

        UsernameString = csvValues[4]; // If a User doesn't exist, use the username from CSV

    } else {

        UsernameString = csvValues[4] + '.sbx'; // If a user exists, update the username from CSV with ".sbx" suffix

    }

// Populate other required fields for User record
    User newUser = new User(
        IsActive = Boolean.valueOf(csvValues[0]),
        FirstName = csvValues[1],
        LastName = csvValues[2],
        Email = csvValues[3],
        Username = UsernameString,
        ProfileId = profilesMap.get(csvValues[5]).Id, // Get ProfileId based on Profile Name
        TimeZoneSidKey = csvValues[6],
        LocaleSidKey = csvValues[7],
        EmailEncodingKey = csvValues[8],
        LanguageLocaleKey = csvValues[9],
        Alias = csvValues[10]
    );

    if (!String.isBlank(csvValues[11])) { // UserRole is optional, so check if the values not blanck

        newUser.UserRoleId = rolesMap.get(csvValues[11]).Id; // Get UserRoleId based on Role Name

    }

    usersToInsert.add(newUser); // Add User record to arrat
}

if (!usersToInsert.isEmpty()) { // Try to insert User records, if the array is not empty
    try {
        insert usersToInsert;
        System.debug('Users inserted successfully.');
    } catch (Exception e) {
        System.debug('Error inserting users: ' + e.getMessage());
    }
}

List<PermissionSetAssignment> permissionSetAssignmentsToInsert = new List<PermissionSetAssignment>();

// Loop of loops j columns of possible Permission Sets by i rows of users

for (Integer j = 13; j < 16; j++) {

    for (Integer i = 1; i < csvRows.size(); i++) {

        List<String> csvValues = csvRows[i].split(',');

        if (!String.isBlank(csvValues[j])) {

            PermissionSetAssignment newPermissionSetAssignment = new PermissionSetAssignment (
                AssigneeId = usersToInsert[i-1].Id,
                PermissionSetId = permissionsetsMap.get(csvValues[j]).Id
            );
            permissionSetAssignmentsToInsert.add(newPermissionSetAssignment);

        }
    }
}

if (!permissionSetAssignmentsToInsert.isEmpty()) {
    try {
        insert permissionSetAssignmentsToInsert;
        System.debug('Permission set assignments inserted successfully.');
    } catch (Exception e) {
        System.debug('Error inserting permission set assignments: ' + e.getMessage());
    }
}