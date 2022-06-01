# Architect Journey: Identity and Access Management

## Identity Management Concepts
- Exam Weight: 17%

### [Identity Basics](https://trailhead.salesforce.com/content/learn/modules/identity_basics?trailmix_creator_id=strailhead&trailmix_slug=architect-identity-and-access-management)

SF Identity lets to give right people the right access to the right resources at right time.

Main features of SF Identity:
- SSO - lets users access all authorized resources without logging in separately to each one—and without having to create (and remember) different user credentials for each app.
- Connected apps - the "authorized resources" the signed-on users have access to
- Social sign-on - users log in to SF with their external provider credentials
- MFA - users have to provide 2+ factors to login (1st factor is user password)
- My Domain - SF URL customized to include a company of brand name
- Centralized user account management - admins manage all their users in one place
- User provisioning for connected apps - manage user information across multiple systems and connected apps
- Identity Connect - sync users from Active Direcory to SF
- App Launcher - one location in SF to access all apps (incl. 3rd party and connected apps) without havin to log in each time

Protocols SF and other providers follow to implement identity solutions:
- SAML - Security Assertion Markup Language - used for SSO. It's XML-based protocol.
- OAuth 2.0 - open protocol used to allow secure data sharing between apps
- OpenID Connect - adds an authentication layes to OAuth 2.0 to enable secure exchange of user information

SF service provider vs. SF identity provider:
- SF as a service provider - users want to get access to SF uisng their external identity (e.g. Microsoft)
- SF as an identity provider - users authenticated in SF want to open external apps (e.g. Gmail)

### [Identity and Access Management for Beginners](https://www.youtube.com/watch?v=fcSXiUsU5lE)
Youtube clip ~30 min

### [User Authentication](https://trailhead.salesforce.com/content/learn/modules/identity_login?trailmix_creator_id=strailhead&trailmix_slug=architect-identity-and-access-management)

MFA verification methods (in addition to SF username + password):
- SF Authenticator
- 3rd party TOTP (time-based one time password) authenticator apps - Google, Microsoft, etc.
- Security keys

Users are prompted for MFA:
- Every time they login
  - Through UI, API, or both
- May be prompted for additional circumstances
  - When user accesses connected app, report, or dahsboard - **high assurance authentication**
  - During a custom login flow or within custom app, e.g. before reading a license agreement

### [OAuth with Salesforce Demystified](https://www.youtube.com/watch?v=zpToAGuhg60)
Youtube clip ~41 min

### [Salesforce Licensing](https://trailhead.salesforce.com/content/learn/modules/salesforce-licensing)

Types of licenses:
- Platform licenses - define functionality of org as a whole
- User licenses - define functionality user can access
- Permission set licenses - also define user-level features, a user can be assigned multiple of them

Each org must have at least one **edition**, which provides functionality needed to activate the org. An edition icludes at least 1 platform license and can contain 0+ user licenses. An org may have more than 1 edition, but all editions must be on the same level (e.g. Unlimited).
An **add-on** can include platform license(s), user licenses, permission set license or all together.

**Platfrom-level permissions** specify features and capabilities for the org as a whole. Turned on or off by the provisioning system (not an admin) when purchased. **Platform-level preferences** are set by (admin) users.

**Profile** is a subset of functionality defined in a user license or permission set license, it defines baseline functionality for a user, which can't be revoked as long as the profile is assigned to the user.

**Permission Set** is also a subser of functionlity, but a user can have multiple PS.

### [How to Provision Salesforce Communities Users](https://developer.salesforce.com/blogs/developer-relations/2014/06/how-to-provision-salesforce-communities-users)

To provision a community user:
1. Create a contact and associate it to an account
2. Create a user record from the contact and assign the user profile that has access to your communities

The account type associated to the contact determines the user that can be created:
- Person account - only customer users
- Non-partner account - only customer users
- Partner account - customer or partner users

External users can be created by SF users or other external users who have delegated admin permissions:
| License | Permission | Usercan create |
|---|---|---|
| Salesforce | “Manage External Users” | Users on Accounts he has read access to |
| Partner Community and Partner Portal | “Delegated External User Administrator” | Users on his Account |
| Customer Portal Manager and Customer Communities Plus | “Delegated External User Administrator” | Users on his Account |

As opposed to Customer Community users, Partner users are role-based. The role is defined at the Account level. The Partner Account can have between one and three roles (based on the org-level setting defined in Community settings).

The self-registration user flow is as follows:
1. The visitor clicks or gets redirected to the Self-Registration page
2. The visitor fills in the form and submits his information
3. Salesforce creates Contact and User records
4. If the user profile has been previously added to the community, the user gets instant access to the community
5. Optionally, he receives an email (option needs to be selected in setup)

Methods are to provision a new user through Apex:
- createPortalUser(user, accountId, password) lets you create an external user associated to a Customer or Partner account.
- createPersonAccountPortalUser(user, ownerId, password) lets you create an external user associated to a Person Account.

**Just-In-Time Provisioning over SAML**
Just-in-Time provisioning works with your SAML identity provider to pass the correct user information to Salesforce in a SAML 2.0 assertion attribute statement. You can both create and modify users, contacts, and accounts this way. Because Just-in-Time provisioning uses SAML to communicate, your organization must have SAML-based single sign-on enabled.  
It’s required that you use Federation ID as your SAML Subject’s NameID. It does not need to be in the form of an email address.

**Mass-User Provisioning**
- Data Loader
- Bulk User Provisioning via API (see Apex methods above)
- Using Identity Connect to Integrate With Active Directory

A Salesforce user can be the owner of up to 50,000 person or business account portal users. 

### [Single Sign-On Implementation Guide](https://help.salesforce.com/s/articleView?id=sf.sso_about.htm&type=5)

... to be continued...