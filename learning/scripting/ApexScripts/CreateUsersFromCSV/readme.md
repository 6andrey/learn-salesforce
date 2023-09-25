# --- DRAFT --- Salesforce - How to Create List of Users from CSV File

## Recommended Use

1. **Salesforce Non-Production Environments**: Sandboxes, Scratch Orgs

## Benefits

1. All steps are perfomed via CLI
2. CSV file is easy to read and can be easily maintained. All Lookup fields are stored as Names/Developer Names and not Ids
3. 1 DML operation per object (User, PermissionSetAssignment, GroupMember) per 200 records

## Open Itenms

1. [ ] To verify if Permission Set Assignments can be inserted in one DML operation for both Permission Sets and Permission Set Groups
2. [ ] To create Apex Script for Portal Users insert

## Requirements

1. SF CLI
2. System Administrator access to Salesforce org
3. Salesforce org is authenticated in SF CLI

## Recommendations

1. VS Code + Salesforce Extensions Pack

## CSV File Structure

Plain list of required and optional fields for User object, as well as optional Permission Set Groups, Permission Sets, and Public Groups

|Column #|Column Label|Description|
|-|-|-|
|0|IsActive|Note that User must be active to assign Permission Sets, PermissionSet Groups, or Public Groups to it. If used for training, be aware of number of active users limit in your org (e.g. Dev Org = 1 additional active user)|
|1|FirstName||
|2|LastName||
|3|Email|Email Address will be used to send `finish resetting your password` to enable users to log in|
|4|Username|Must be unique value. Apex Script will check if username already exists, and if yes, will add `.sbx` suffix to the username. Be aware of this behavior when working in a sandbox with existing users cloned from another sandbox or Production org|
|5|Profile|Use Profile Name (e.g. `System Administrator` or `Standard User`)|
|6|TimeZoneSidKey||
|7|LocaleSidKey||
|8|EmailEncodingKey||
|9|LanguageLocaleKey||
|10|Alias||
|11|UserRole|**Optional** - leave empty if not required. Use Role Name (e.g. `CEO`)|
|12|PSG1|**Optional** - leave empty if not required. Permission Set Group - use Developer Name|
|13|PS1|**Optional** - leave empty if not required. Permission Set - Use API Name|
|14|PS2|**Optional** - leave empty if not required. Permission Set - Use API Name|
|15|PS3|**Optional** - leave empty if not required. Permission Set - Use API Name|
|16|GM1|**Optional** - leave empty if not required. Public Group - Use Group API Name|
|17|GM2|**Optional** - leave empty if not required. Public Group - Use Group API Name|
|18|GM3|**Optional** - leave empty if not required. Public Group - Use Group API Name|

```CSV

    IsActive,FirstName,LastName,Email,Username,Profile,TimeZoneSidKey,LocaleSidKey,EmailEncodingKey,LanguageLocaleKey,Alias,UserRole,PSG1,PS1,PS2,PS3,GM1,GM2,GM3
    TRUE,Test6,User,email@example.com,test6@example.com.testuser6_20230925,Standard User,America/New_York,en_US,UTF-8,en_US,T6User,CEO,,Test_Permission_Set,CRMUserPsl,SalesUserPsl,,,

```

## Runbook

1. [ ] Deploy Static Resource (CSV file)
    >  sfdx force:source:deploy -p path_to_static_resourcees_folder/staticresources -u tagret_username
2. [ ] Execute Apex Script
    > sfdx force:apex:execute -f path_to_apex_script/insertUsersFromCSV.apex -u tagret_username