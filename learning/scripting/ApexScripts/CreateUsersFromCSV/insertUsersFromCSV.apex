String resourceName = 'UsersList'; // Replace with the actual name of your Static Resource
String csvBody = '';
Blob csvBlob;

StaticResource csvResource = [SELECT Id, Body FROM StaticResource WHERE Name = :resourceName LIMIT 1];
if (csvResource != null) {
    csvBlob = csvResource.Body;
    csvBody = csvBlob.toString();
    System.debug(csvBody);
} else {
    System.debug('Static Resource not found.');
    return;
}

Integer psgFirst = 12; // First column with Permission Set Group
Integer psgLast = 12; // Last column with Permission Set Group
Integer psFirst = 13; // First column with Permission Set
Integer psLast = 15; // Last column with Permission Set
Integer gFirst = 16; // First column with Public Group
Integer gLast = 18; // Last column with Public Group

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
Map<String, SObject> groupsMap = recordsMap('DeveloperName', [SELECT DeveloperName FROM Group]);
Map<String, SObject> usersMap = recordsMap('Username', [SELECT Username FROM User]);

// Parse and insert user records 

List<User> usersToInsert = new List<User>();

// Split CSV rows by line breaks
List<String> csvRows = csvBody.split('\n');

// Create array with User fields
for (Integer i = 1; i < csvRows.size(); i++) { // Skip the header row (row zero)
    List<String> csvValues = csvRows[i].split(',');

    String UsernameString = '';

    if (usersMap.get(csvValues[4]).Id == null) {

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

List<PermissionSetAssignment> permissionSetGroupAssignmentsToInsert = new List<PermissionSetAssignment>(); // PSG Assignments user the same object as PS Assignments

// Permission Set Group Assignments Loop of loops: j columns of possible Permission Sets by i rows of Users

for (Integer j = psgFirst; j <= psgLast; j++) {

    for (Integer i = 1; i < csvRows.size(); i++) {

        List<String> csvValues = csvRows[i].split(',');

        if (!String.isBlank(csvValues[j])) {

            PermissionSetAssignment newPermissionSetGroupAssignment = new PermissionSetAssignment ( // PSG Assignments user the same object as PS Assignments
                AssigneeId = usersToInsert[i-1].Id,
                PermissionSetGroupId = permissionsetgroupsMap.get(csvValues[j]).Id
            );
            permissionSetGroupAssignmentsToInsert.add(newPermissionSetGroupAssignment);

        }
    }
}

if (!permissionSetGroupAssignmentsToInsert.isEmpty()) {
    try {
        insert permissionSetGroupAssignmentsToInsert;
        System.debug('Permission set groiup assignments inserted successfully.');
    } catch (Exception e) {
        System.debug('Error inserting permission set group assignments: ' + e.getMessage());
    }
}

List<PermissionSetAssignment> permissionSetAssignmentsToInsert = new List<PermissionSetAssignment>();

// Permission Set Assignments Loop of loops: j columns of possible Permission Sets by i rows of Users

for (Integer j = psFirst; j <= psLast; j++) {

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

List<GroupMember> groupMembersToInsert = new List<GroupMember>();

// Group Members Loop of loops: j columns of possible Grroups by i rows of Users

for (Integer j = gFirst; j <= gLast; j++) {

    for (Integer i = 1; i < csvRows.size(); i++) {

        List<String> csvValues = csvRows[i].split(',');

        if (!String.isBlank(csvValues[j])) {

            GroupMember newGroupMember = new GroupMember (
                UserOrGroupId = usersToInsert[i-1].Id,
                GroupId = groupsMap.get(csvValues[j]).Id
            );
            groupMembersToInsert.add(newGroupMember);

        }
    }
}

if (!groupMembersToInsert.isEmpty()) {
    try {
        insert groupMembersToInsert;
        System.debug('Group members inserted successfully.');
    } catch (Exception e) {
        System.debug('Error inserting group members: ' + e.getMessage());
    }
}

// reset passwords for inserted users, and send them email
for (User insertedUser : usersToInsert) {
    System.resetPassword(insertedUser.Id, true);
}