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

**Federated Authentication** is available in: All Editions
**Delegated Authentication** is available in: Professional, Enterprise, Performance, Unlimited, Developer, and Database.com Editions
**Authentication Providers** are available in: Professional, Enterprise, Performance, Unlimited, and Developer Editions

SSO use cases:
- Salesforce as the Service Provider or Relying Party
  - Users are logged in to your org from an identity provider or authentication provider, which authenticates their credentials.
  - Define identity provider with SAML, use predefined auth provider with OpenID, or create custom auth provider
- Salesforce as the Identity Provider or OpenID Connect Provider
  - Users are logged in to an external app with their Salesforce credentials.
  - Configure the external app as connected app, define SF org as the SAML identity provider
  - Also, use OpenID Connect to enable SF as OpenID provider
- Salesforce as Both
  - Salesforce to act as both the identity provider and the service provider
  - Chain identity providers with SAML or OpenID Connect exclusively
  - Users to login to SF org from Google and then have acces to SF mobile custom app. Configure Google as SAML identity provider for your SF org. Thjen configure your SF org as SAML identity provider for the mobile app
- Salesforce and Delegated Authentication
  - Users to log in to multiple apps with the same user credentials. E.g. users can separately log into SF, Amazon and Google using the same credentials.
  - Manage delegated authentication on a permission set level rather then on an org level
  - LDAP server can be integrated with SF to configure delegated authentication
  - Delegated authentication can be also configured with a token instead of a password

SSO terminology
- Federated Authentication and Security Assertion Markup Language (SAML). These terms apply to SSO enabled with SAML.
  - Federated Authentication. With federated authentication, users log in one time to access multiple apps. For example, you log in to your Salesforce org and from there can access your company’s benefits app, Workday.
  - Security Assertion Markup Language (SAML). SAML is an open standard authentication protocol that you can use to implement SSO in your Salesforce org. SAML allows identity providers and service providers to securely exchange user information, enabling user authentication between services.
  - Identity Provider. An identity provider acts as a trusted service that authenticates a user’s identity.
  - Service Provider. A service provider is the application a user wants to access, such as a Salesforce org or a third-party app like Workday.
  - SAML Request. When a user attempts to access the service provider, the service provider sends a SAML request asking the identity provider to authenticate the user.
  - SAML Response. To authenticate the user, the identity provider sends a SAML response to the service provider. The response contains a signed SAML assertion with facts about the user.
  - SAML Assertion. A SAML assertion, which is part of a SAML response, describes a user by asserting facts, like username or email address. During authentication, the identity provider signs the SAML assertion and the service provider validates the signature.
  - Just-in-Time (JIT) Provisioning. Use JIT provisioning with SAML SSO to automatically register a user account with the service provider the first time a user logs in. For example, a new employee logs in to Salesforce for the first time with SAML SSO. JIT provisioning automatically registers a new user account in your Salesforce org for the employee.
- OpenID Connect and Custom Authentication Protocols. hese terms apply to SSO enabled with OpenID Connect. Some terms, where noted, apply to both OpenID Connect and similar, custom authentication protocols.
  - OpenID Connect is an open standard authentication protocol built on top of OAuth 2.0. With OpenID Connect, the relying party and OpenID provider can exchange information about who a user is and what they can do with a service.
  - Custom Authentication Protocol - describes any custom authentication protocol that can be used with an authorization service, such as OAuth. Such protocols have the same core functions as OpenID Connect, but they don't conform to the OpenID Connect standard.
  - OpenID Provider - authenticates users as requested by the relying party.
  - Authentication Provider is a framework that allows you to connect Salesforce to a third party for authorized data access, authentication, or both, depending on the protocol. When you're using authentication providers, Salesforce is always the relying party.
  - Relying Party - a service provider. It relies on the OpenID provider or identity provider for authentication.

**SAML SSO Flows**

Service Provider-Initiated SAML Flow
In a service-provider-initiated flow, the service provider begins the login process with a SAML request to the identity provider. Here’s how this flow works.
1. The user requests a secure session to access a protected resource in the service provider. For example, the user clicks a link to fill out a form in the service provider. But the form is a protected resource, meaning the user can only access it after logging in.
2. The service provider initiates login by sending a SAML request to the identity provider, asking it to authenticate the user.
3. The identity provider sends the user to a login page.
4. The user enters their identity provider login credentials and the identity provider authenticates the user.
5. The identity provider now knows who the user is, so it sends a cryptographically signed SAML response to the service provider. The SAML response contains a SAML assertion that tells the service provider who the user is.
6. The service provider validates the signature in the SAML response and identifies the user.
7. The user is now logged in to the service provider and can access the protected resource.

Identity Provider-Initiated SAML Flow
In an identity provider-initiated login flow, a SAML request is unnecessary because the identity provider starts the flow with a SAML response. An identity provider-initiated flow is a shortened version of a service provider-initiated flow. Here’s how this flow works:
1. The user logs in to the identity provider.
2. The user clicks a button or link to access the service provider. For example, the user clicks an app on the App Launcher page in a Salesforce 3. org.
3. The identity provider initiates login by sending a cryptographically signed SAML response to the service provider. The SAML response contains a SAML assertion that tells the service provider who the user is.
4. The service provider validates the signature in the SAML response and identifies the user.
5. The user is now logged in to the service provider.

You can customize these pages for SAML SSO using external identity providers:
- Identity Provider Login Page
- RelayState parameter to control where users are directed after successful login
- Custom Logout Page
- Custom Error Page (optional)

Configure Salesforce as a service provider with SAML single sign-on (SSO):
1. Set up SSO.
2. (Optional) Set up an identity provider to encrypt SAML assertions.
3. (Optional) Enable JIT provisioning. For more information about JIT provisioning, see Just-In-Time Provisioning for SAML.
4. If you selected Custom SAML JIT with Apex Handler for JIT provisioning, edit the SAML JIT handler.
5. Test the SSO connection.

**Just-in-Time Provisioning for SAML**
With JIT provisioning, your identity provider passes user information to Salesforce in a SAML 2.0 assertion, which is processed by an Apex JIT handler class. The JIT handler does the heavy lifting of creating and updating user accounts. To let Salesforce manage the JIT handler for you, configure standard JIT provisioning. If you want more control, configure JIT provisioning with a custom handler. 

Authentication Providers
Social sign-on

- Use Salesforce Managed Authentication Providers (Facebook, GitHub, Google, LinkedIn, Salesforce, and Twitter)
- Choose an Authentication Provider to Configure Salesforce as the Relying Party
- Add an Authentication Provider to Your Org’s Login Page
- Add an Authentication Provider to Your Experience Cloud Site’s Login Page
- Add Request Parameters to an Authentication Provider

**Salesforce as an Identity Provider**

**Salesforce as Both the Service Provider and Identity Provider**
- Create an Identity Provider Chain. In an identity provider chain, Salesforce sits in the middle, linking a third-party identity provider with a client app.
- Configure SAML SSO Between Multiple Orgs or Experience Cloud Sites. If your company deploys multiple Salesforce orgs or sites, you can configure an org or site as the identity provider for one or more service provider orgs or sites. With this SAML SSO solution, you save your users from managing multiple passwords.
- Configure SSO Between Orgs with the Salesforce Authentication Provider. Salesforce can act as an authentication provider for other orgs, allowing your users to log in to an org acting as the relying party with credentials from the authentication provider. 

**Single Logout**
With single logout (SLO), your users can log out from a single application and be automatically logged out from all connected apps. To use SLO, the identity providers, service providers, and relying parties must be configured for single sign-on (SSO) and registered for SLO.

SF supports the following protocols (SLO can be initiated from the identity provider or any of the connected apps):
- SAML SLO as an identity provider or service provider
- OpenID Connect SLO as an identity provider or relying party
Salesforce supports session index parameters in requests and responses with SAML SLO. When a user logs out of a connected app registered for SAML SLO, the session index parameter is required to identify which user session to end.

**Delegated Authentication**
With delegated authentication, one system relies on another system to validate user credentials.
The process Salesforce uses to authenticate users with delegated authentication:
1. When a user tries to log in—either online or using the API, SF tries to validate the username and checks the user’s permissions and access settings.
2. If the is SSO enabled for the user, SF calls to the SOAP-based SSO web service to validate the username and password.
3. The web service call passes the username, password, and source IP to your SSO web service implementation, which SF servers then access. The source IP is the address where the login request originated.
4. Your SSO web service implementation validates the passed information and returns either true or false.
5. When the response is true, the login process continues and the user is logged in to your org. When false, the user gets an error message that the username and password combination is invalid.

### [Deploying Single Sign-On and Identity for Employees, Customers, and Partners](https://www.youtube.com/watch?v=swguz0ZKggM)
Youtube clip ~40 min

### [Auditing](https://help.salesforce.com/s/articleView?language=en_US&type=5&id=sf.security_overview_auditing.htm)

- Record Modification Fields. All objects include fields to store the name of the user who created the record and who last modified the record. This provides some basic auditing information.
- Login History. You can review a list of successful and failed login attempts to your organization for the past six months. Who logged in, at what time, and from where, Authentication Method References, HTTP Login Method, SAML Single Sign-On, My Domain, License Manager Users.
- Field History Tracking. You can also enable auditing for individual fields, which will automatically track any changes in the values of selected fields. Although auditing is available for all custom objects, only some standard objects allow field-level auditing. Field history data is retained for up to 18 months through your org, and up to 24 months via the API.
- Setup Audit Trail. Administrators can also view a Setup Audit Trail, which logs when modifications are made to your organization’s configuration. Last 180 days.

### [Shield Platform Encryption](https://trailhead.salesforce.com/content/learn/modules/spe_admins)

The basis of encryption is scrambling and unscrambling. **Keys** do the scrambling and unscrambling, and secrets keep your keys safe and working properly. A key is a string of bits that scramble and unscramble data. **Secrets** are pieces of keys. That is, they work together in a variety of ways to secure your data. Secrets combine to create encryption keys, allow servers to double-check and verify that a key is up to date, and verify that requests for access to your data are from authorized key holders.

**Tenant secrets** and **master secrets** are keys for keys, or that extra layer of protection. Master secret is generated 3 times a year, with each release.

Classic Encryption vs. Shield Platform Encryption:
- Classic Encryption is included in a base price of SF license, and can protect a special type of custom text field with 128-bit AES keys.
- Shield Platform Encryptiom is available in Developer Edition and requires a purchase for all other editions. It can encrypt all kind of data at reston SF Platfrom, with a stronger 256-bit AES key. It allows to search for encrypted data in database.

Field values are encrypted only in records created or updated after encryption is enabled.

Best Practices:
- Encrypt Only Where Necessary
  - Define a threat model for the organization. Create a data classification scheme and to decide which data to encrypt.
  - Not all data is sensitive. Focus on information that requires encryption to meet regulatory, security, compliance, and privacy requirements.
  - Create a data classification scheme early.
- Assign Permissions and Key Access Judiciously
  - Create a strategy early for backing up and archiving keys and data. You can’t reset a tenant secret. Salesforce can’t help with deleted, destroyed, or misplaced tenant secrets. 
  - Grant the “Manage Encryption Keys” permission to authorized users only.
  - Understand that encryption applies to all users, regardless of permissions. 

### [Secure Your Apps with Salesforce Shield](https://trailhead.salesforce.com/en/content/learn/trails/shield?trailmix_creator_id=strailhead&trailmix_slug=architect-identity-and-access-management)

**Event Monitoring** can track events, such as logins, logouts, URI, Lightning (clicks, performance, and errors in Lightning Experience and SF mobile app), VF page loads, API calls, Apex executions, Report exports, etc. - in total of 50 event types. 
**Event log files** available for download after 24 hours. Retention deopends on SF edition:
- Developer - 1 day
- Enterprise, Unlimited, Performace - 1 day. For extra cose - 30 days

[SF Event Log File Browser](https://salesforce-elf.herokuapp.com) is SF connected app allows easily find and download events declaratively.

Use Developer Console: File -> Open -> Objects -> EventLogFile -> Open -> Select fields and create a query.

**Real-Time Event Monitoring**

Salesforce Real-Time Event Monitoring is a user activity and application monitoring service available to Salesforce customers through the purchase of an add-on license. Real-Time Event Monitoring is included in your Salesforce Event Monitoring license. It can be used with Transaction Security to automatically block risky user actions and notify you in real time when they occur.

Using Real-Time Event Monitoring, you can interact with events either by subscribing to standard platform events, or by investigating events stored in big objects.
- Standard Platform Events. The user’s actions are captured and streamed as a platform event.
  - Event Objects. Real-Time Event Monitoring objects have three primary uses: streaming data, storing data, and enforcing policies on data. 
- Big Objects. Some Real-Time Events are stored as big objects so that you can look at historical event data for 6 months to 10 years in the past.

Realt-Time Event Monitoring use cases:
- Audit user activity - over 15 different events
- Enforce security policies. you can block an action from occurring.
- Keep track of app performance

**Enhanced Transaction Security**

**Transaction Security** is a feature that monitors Salesforce events in real time to spot potential trouble based on rules you create. With Transaction Security, you can create policies that consist of events, notifications, and actions.

`To use Transaction Security, you have to first purchase a Salesforce Shield or Salesforce Shield Event Monitoring add-on subscription.`

You can select which actions to take if the policy is triggered:
- Block the operation.
- Require a higher level of assurance using multi-factor authentication.
- Do nothing (this can be useful for testing).
- Opt-in for Policy notifications, sent via:
  - Email
  - In-app notification to the Salesforce app
  - Both email and in-app notifications

### [Customizing User Authentication with Login Flows](https://www.youtube.com/watch?v=gYes8OLAc-k)
Youtube clip ~40 min

## Accepting Third-Party Identity in Salesforce
- Exam Weight: 21%

### [Configure a Salesforce Authentication Provider](https://help.salesforce.com/s/articleView?id=sf.sso_provider_sfdc.htm&type=5)

1. Define the Salesforce authentication provider in your org.
   1. Setup -> Auth. Providers 
2. Test the connection.
   1. In a browser, open the Test-Only Initialization URL on the Auth. Provider detail page. It redirects you to the authentication provider and asks you to sign in. You’re then asked to authorize your app. After you authorize, you’re redirected to Salesforce.
3. Add the authentication provider to your login page.
   1. Setup -> My Domain -> Authentication Configuration -> select Auth provider

### [Social Single Sign-On with OpenID Connect](https://www.youtube.com/watch?v=XIFMnzbG5Ew)
Youtube clip ~20 min

### [Identity 101: Design Patterns for Access Management](https://www.youtube.com/watch?v=_0v3b029sH4&t=822s)
Youtube clip ~40 min

Design Patterns:
- Hub-Spoke Model
  - Authentication to a "Hub" SF org permits access to "Spoke" SF orgs w/o need of explicit sign-on or storing of passwords
- Interview-based login
  - Managing multiple login options to a single service
  - Login discovery approach - Apex hanler lookup logic customized to invoke appropriate auth flow (SSO, OTP, etc.). Username/password no longer required.

### [FAQs for Single Sign-On](https://help.salesforce.com/s/articleView?id=sf.identity_overview.htm&type=5)

- Ways to implement SSO:
  - Configure SF as identity provider, service provider or both.
- View SSO errors
  - Setup -> Login History
- SSO work outside corporate firewall
  - Users outside the firewall can use their network password, or they can be required to connect to corporate network first.
- How to validate SAML response
  - Setup -> Single Sign-On Settings -> click SAML Validation
- Test SSO configuration before enabling it
  - Use sandbox to develop and test config first. Sandbox copies are made with SAML disabled. It cann be enabled on SSO Settings page
- Prevent users from logging in using their passwords
  - [Require Users to Log In with SSO](https://help.salesforce.com/s/articleView?id=sf.sso_enforce_sso_login.htm&type=5)
- Use  MFA for SSO
  - Use free Salesforce MFA incl. in SF for SSO congurations that use SF as identity provider.
  - Use 3rd party MFA for SSO

### [Delegated Authentication](https://help.salesforce.com/s/articleView?id=sf.sso_delauthentication.htm&type=5)
One system relies on another system to validate user credentials. With delegated authentication, users must log in to each app separately. Salesforce has no control over the passwords used to log in to your org. Instead, the external authentication method controls user passwords and associated policies.
Enable the Is Single Sign-On Enabled user permission to hand control of user passwords to the external authentication method.

1. When a user tries to log in—either online or using the API, Salesforce tries to validate the username and checks the user’s permissions and access settings.
2. If the **Is Single Sign-On Enabled** user permission is enabled, Salesforce calls to the SOAP-based SSO web service to validate the username and password.

*Salesforce immediately disposes of the password without storing, logging, or viewing it.*

3. The web service call passes the username, password, and source IP to your SSO web service implementation, which Salesforce servers then access.
4. Your SSO web service implementation validates the passed information and returns either true or false.
5. When the response is true, the login process continues and the user is logged in to your org. When false, the user gets an error message that the username and password combination is invalid.

FAQs for Delegated Authentication:
- Requirements for implementing my web service
  - The implementation must be accessible by SF servers, so deploy the web service on a serverver in your DMZ. Use your server external DNS name when enterin the delegated URL in SSO settings
  - Make the web service available by TLS. A cerificate from a trusted provider is required.
- Mapping considerations
  - Map your org's internal usernames to SF usernames. Generate your server stub from the WSDL file to ensure accuracy.
- Password resets
  - Password resets are disabled for delegated authentication
- View errors
  - Setup -> Delegated Authentication Error History

Configure Salesforce for Delegated Authentication:
1. Enable delegated authentication for your org.
   1. Setup -> SSO Settings -> select `Disable login with Salesforce credentials`
2. Build your web service.
   1. Setup -> API -> click `Download Delegate Authentication WSDL`. Use WSDL file to generate a server-side stub to which to add your delegated authentication implementation.
   2. Add a link to your corporate intrantet or internal web-site. This link takes the user’s credentials after they’re validated and passes them through an HTTP POST to the Salesforce login page. SF only uses the password field to pass it back to your company. To avoid passing your corporate passwords to or from SF, pass another authentication token instead, such as a Kerberos ticket. When the SF server passes the credentials back to you in the Authenticate message, verify them. Then the user can access your org.
3. Specify your delegated authentication gateway URL.
   1. Setup -> SSO Settings -> click Edit -> Enter the URL for the Delegated Gateway URL. For security reasons, Salesforce restricts outbound posts to any of the following.
```
- 80, which accepts only HTTP connections
- 443, which accepts only HTTPS connections
- 1024–66535, which accepts HTTP or HTTPS connections
```
4. Enable permissions.
   1. Enable the `Is Single Sign-On Enabled` permission 
5. (Optional) Force Callouts to the Delegated Authentication Endpoint
   1. Setup -> SSO Settings -> click Edit -> select `Force Delegated Authentication Callout`

### [Configure SSO to Salesforce Using Microsoft AD FS as the Identity Provider](https://trailhead.salesforce.com/en/users/strailhead/trailmixes/architect-identity-and-access-management)

Microsoft Active Directory Federation Services (AD FS) functions as the identity provider for SSO authentication. MS ADFS supports SAML protocol.

**Prerequisites**
- MS Windows Server 2008 R2 Enterprise or Datacenter edition.
- MS ADFS 2.0
- SF org

**Overview**

SAML 2.0 defines roles for parties involved in SSO. A user authenticates to the IdP (AD FS 2.0). The user is then able to access a resource at one or more service providers (SP) without logging in to each service provider. The SP (also known as a “relying party”) is in this instance a SF org.

1. The user authenticates to the AD FS server using Integrated Windows Authentication (Kerberos tokens over HTTP) and requests login to SF.
2. AD FS returns a SAML assertion to the user’s browser.
3. The browser submits the assertion to SF, which logs the user in.

Common Issues:
- Federation ID is case-sensitive
- Assertion has expired. Assertions with a timestamp more than 5 minutes old are rejected.
- Can’t log in to Salesforce. You can still log in with a username and password. Append ?login to the login URL, for example, https://login.salesforce.com/?login.