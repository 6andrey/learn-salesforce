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

## Salesforce as an Identity Provider
Exam Weight: 17%

### [OAuth Authorization Flows](https://help.salesforce.com/s/articleView?id=sf.remoteaccess_oauth_flows.htm&type=5)

In general the OAuth flows consist of three main steps:
1. To initiate an authorization flow, a client app requests access to a protected resource.
2. In response, an authorizing server grants access tokens to the client app.
3. A resource server then validates these access tokens and approves access to the protected resource.

SF mobile app OAuth initial flow:
1. You open the Salesforce mobile app.
2. An authentication prompt displays, in which you enter your username and password.
3. The Salesforce mobile app sends your credentials to Salesforce and initiates the OAuth authorization flow.
4. Salesforce sends the mobile app access and refresh tokens as confirmation of a successful validation of the user and the mobile app.
5. You approve the request to grant access to the Salesforce mobile app.
6. The Salesforce mobile app starts.

All OAuth authorization flows, except for the SAML Assertion flow, require you to define a connected app. The default is five authorizations per connected app per user.

**OAuth Authorization Flow Use Cases**

- **OAuth 2.0 Web Server Flow for Web App Integration**
  - Implements the OAuth 2.0 authorization code grant type. 
  - The server hosting the web app must be able to protect the connected app’s identity, defined by the client ID and client secret.

Authorization flow:
1. Request an Authorization Code.
   1. The external web service—via the connected app—posts an authorization code request using the authorization code grant type to the Salesforce authorization endpoint. 

Example
``` text
https://MyDomainName.my.salesforce.com/services/oauth2/authorize?                                 // authorization endpoin
client_id=3MVG9IHf89I1t8hrvswazsWedXWY0i1qK20PSFaInvUgLFB6vrcb9bbWFTSIHpO8G2jxBLJA6uZGyPFC5Aejq&  // consumer key
redirect_uri=https://www.mycustomerorderstatus.com/oauth2/callback&                               // user redirected after successful authorization
response_type=code                                                                                // must be `code` for this type of flow
```
2. User Authenticates and Authorizes Access
   1. If users previously approved access, they don’t have to approve access again.
3. Salesforce Grants Authorization Code
   1. Salesforce redirects users to the callback URL

Example
``` text
https://www.mycustomerorderstatus.com/oauth2/callback?                                            // callback URL
code=aPrx4sgoM2Nd1zWeFVlOWveD0HhYmiDiLmlLnXEBgX01tpVOQMWVSUuafFPHu3kCSjzk4CUTZg==                 // authorization code, expires after 15 minutes
```
4. Request an Access Token
   1. The connected app passes the authorization code to the Salesforce token endpoint as an HTTP POST.

Example
``` text
POST /services/oauth2/token HTTP/1.1                                                              // SF OAuth 2.o endpoint
Host: mycompany.my.salesforce.com                                                                 // URL of hosting service
Content-length: 307                                                                               // Request content's length
Content-type: application/x-www-form-urlencoded                                                   // Requested format of the returned response, can also be xml and json
grant_type=authorization_code&                                                                    // must be `authorization_code` for this type of flow
code=aPrxhgZ2MIpkSy0aOdn07LjKFvsFOis6RGcWXz7p8JQCjcqfed5NQLe7sxWwMY_JQFuLwHRaRA==&                // temporary authorization code from auth server
client_id=3MVG9IHf89I1t8hrvswazsWedXWY0iqK20PSFaInvUgLFB6vrcb9bbWFTSIHpO8G2jxBLJA6uZGyPFC5Aejq&   // consumer key of the connected app
client_secret=*******************&                                                                // consumer secret of the connected app
redirect_uri=https://www.mycustomerorderstatus.com/oauth2/callback                                // user redirected after successful authentication
```
   2. Instead of sending client credentials as parameters in the body of the POST, Salesforce supports the HTTP Basic authentication scheme. This scheme's format requires the client_id and client_secret in the authorization header 
5. Salesforce Grants an Access Token

Example
``` json
{
"access_token": "00DB0000000TfcR!AQQAQFhoK8vTMg_rKA.esrJ2bCs.OOIjJgl.9Cx6O7KqjZmHMLOyVb.U61BU9tm4xRusf7d3fD1P9oefzqS6i9sJMPWj48IK",
"signature": "d/SxeYBxH0GSVko0HMgcUxuZy0PA2cDDz1u7g7JtDHw=",
"scope": "web openid",
"id_token": "eyJraWQiOiIyMjAiLCJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdF9oYXNoIjoiSVBRNkJOTjlvUnUyazdaYnYwbkZrUSIsInN1YiI6Imh0dHBzOi8vbG9...",
"instance_url": "https://mycompany.my.salesforce.com",
"id": "https://login.salesforce.com/id/00DB0000000TfcRMAS/005B0000005Bk90IAC",
"token_type": "Bearer",
"issued_at": "1558553873237"
}
```

- **OAuth 2.0 User-Agent Flow for Desktop or Mobile App Integration**
  - Users authorize a desktop or mobile app to access data using an external or embedded browser.
  - Client apps running in a browser using a scripting language such as JavaScript can also use this flow. 
  - This flow uses the OAuth 2.0 implicit grant type.
  - The connected app receives the access token as an HTTP redirection.

OAuth 2.0 user-agent flow:
1. Redirection to Authorization Endpoint
   1. the connected app redirects the user to the authorization endpoint.

Example
``` text
https://login.salesforce.com/services/oauth2/authorize?response_type=token&
client_id=3MVG9lKcPoNINVBIPJjdw1J9LLJbP_pqwoJYyuisjQhr_LLurNDv7AgQvDTZwCoZuDZrXcPCmBv4o.8ds.5iE&
redirect_uri=https://www.customercontactinfo.com/user_callback.jspk&
state=mystate                                                                                       // This value must be URL encoded
```
2. User Authenticates and Authorizes Access
3. Salesforce Grants Access Token

- **OAuth 2.0 Refresh Token Flow for Renewed Sessions**
  - renews access tokens issued by the OAuth 2.0 web server flow or the OAuth 2.0 user-agent flow

Steps:
1. The connected app uses the existing refresh token to request a new access token.
2. After verifying the request, Salesforce grants a new access token to the client.

- **OAuth 2.0 Authorization and Session Management for Hybrid Apps**
  - A hybrid app sets requested domain cookies and bridges an access token into a web session. 
  - The access token and web session aren’t connected in these flows. 
  - You must track when the access and refresh tokens expire and when the web session expires, and then manually rebridge the session to avoid interrupted service. 
  - To avoid this complex process, use the OAuth 2.0 hybrid app flows that connect the access and refresh tokens with the web session to give hybrid apps direct web session management.

- **OAuth 2.0 JWT Bearer Flow for Server-to-Server Integration**
  - Authorize servers to access data without interactively logging in each time
  - Uses a certificate to sign the JWT request
  - Requires prior approval of the client app

Authorization flow:
1. Create a JWT
   1. Upload an X509 Certificate to a Java Key Store (JKS).
   2. Register the X509 Certificate for the connected app. When the connected app is saved, the client_id and client_secret are generated and assigned to the app.
   3. Build an app that generates a JWT, which is signed with the X509 Certificate’s private key. 
2. Request Access Token
   1. The connected app posts a token request to the Salesforce instance’s token endpoint. It includes the JWT in the post.
3. Salesforce Grants Access Token
4. Access Protected Data

- **OpenID Connect Dynamic Client Registration for External API Gateways**
  - To enable your Salesforce instance as an independent OAuth authorization server to protect resources hosted on an external API gateway.
  - To directly register client apps as connected apps with Salesforce. 

Steps:
1. Create a connected app for API gateway
2. Configure the APOI gateway
3. API gateway registers a connected app
4. SF responds with the registered connected app metadata
5. API gateway sends a request to the SF authorization endpoint to approve the registered connected app. SF generates an access token for the connected app.
6. API gateway send a request to SF introspectioon endpoint to validate the access token
7. API gateway allows the registered connected app to access the protected data

- **Generate an Initial Access Token**
  - Before generating an initial access token, create a connected app to integrate the OAuth 2.0 client with the Salesforce API. 
  - The registering connected app must provide the initial access token in its request to the dynamic client registration endpoint

- **OpenID Connect Token Introspection**
  - Allows all OAuth connected apps to check the current state of an OAuth 2.0 access or refresh token.
  - As part of this flow, the authorization server validates, or introspects, the client app’s access token.
  - The format of the token introspection endpoint URL is `https://hostname/services/oauth2/introspect`.

- **OAuth 2.0 Device Flow for IoT Integration**
  - To integrate apps that run on devices with limited input or display capabilities,
  - Command-line apps can also use this flow.

Authorization flow:
1. Device Requests Authorization
   1. `esponse_type=device_code`
2. Salesforce Returns Verification Codes
   1. Salesforce returns a human-readable user code, verification URL, and device code.
3. User Authenticates and Authorizes While Device Polls the Token Endpoint
   1. The user opens a browser, navigates to the verification URL, and enters the code displayed on the device.
4. Salesforce Grants Access Token

- **OAuth 2.0 Asset Token Flow for Securing Connected Devices**
  - Asset tokens are an open-standards-based JWT authentication token for verifying and securing requests from connected devices. 

- **OAuth 2.0 Username-Password Flow for Special Scenarios**
  - Recommend avoiding this flow because it passes credentials back and forth.
  - Use it only if there’s a high degree of trust between the resource owner and the client
  - Set user permissions to minimize access and protect stored credentials from unauthorized access.

Flow:
1. The connected app requests an access token by sending the user’s login credentials to the Salesforce token endpoint.
2. After verifying the request, Salesforce grants an access token to the connected app.
3. The connected app can use the access token to access the protected data on the user’s behalf.

- **SAML Assertion Flow for Accessing the API**
  - An alternative for orgs that use SAML to access Salesforce and want to access the API the same way. 
  - Can use this assertion flow without a connected app.

### [OAuth With Salesforce Demystified](https://www.youtube.com/watch?v=zpToAGuhg60&t=540s&ab_channel=SalesforceDevelopers)
Yuotube clip ~ 40 min

### [Authorize Apps with OAuth](https://help.salesforce.com/s/articleView?id=sf.remoteaccess_authenticate.htm&type=5)

In Salesforce, you can use OAuth authorization to approve a client application’s access to your org’s protected resources.
You can’t use OAuth independently to authenticate a user’s identity. Instead, use OpenID Connect as an authentication service in addition to OAuth authorization.

**OAuth Tokens and Scopes**
OAuth tokens authorize access to protected resources. Scopes further define the type of protected resources that the connected app can access.

Authorizing server can provide these **OAuth tokens** to the client, dependending on a flow:
- **Authorization code** is passed to client after successful authentication. The client sends the authorization code to the authorization server to obtain an access token and, optionally, a refresh token.
- **Access token** is sent to client after it's authorized. Client sends it to the resource server to request access to protected data. The client must be able to protect the token by using TSL or SSL. It required the *web* scope assigned to the connected app.
- **Refresh token** can have an indefinite lifetime depends on configuration or when explicitely revoked. A client can repeatedly use the token to get access to the resource server.
- **ID token** is a signed data structure that contains authenticated user attributes, including a unique identifier for the user and when the token was issued.
- **Initial access token**. After configuring an OAuth 2.0 connected app, generate an initial access token, which is required to authorize the dynamic client registration request flow.
- **Asset token** is to linking of devices to Service Cloud Asset data.

**OAuth Scopes**:
- Perform ANSI SQL queries on Salesforce CDP data (cdp_query_api)
- Manage Pardot services (pardot_api). Manage the full extent of accessible services in Pardot.
- Manage Salesforce CDP profile data (cdp_profile_api). Manage profile records.
- Access Connect REST API resources (chatter_api)
- Manage Salesforce CDP Ingestion API data (cdp_ingest_api). Upload and maintain external data sets in the Salesforce CDP platform.
- Access Analytics REST API Charts Geodata resources (eclair_api)
- Access Analytics REST API resources (wave_api)
- Manage user data via APIs (api). This scope also includes chatter_api.
- Access custom permissions (custom_permissions). This scope also shows whether the current user has each permission enabled.
- Access the identity URL service (id, profile, email, address, phone)
- Access Lightning applications (lightning). Allows hybrid apps to directly obtain Lightning child sessions.
- Access content resources (content)
- Access unique user identifiers (openid). In the OAuth 2.0 user-agent flow and the OAuth 2.0 web server flow, use the openid scope. In addition to the access token, this scope enables you to receive a signed ID token that conforms to the OpenID Connect specifications.
- Full access (full). Access to all data accessible by the logged-in user, and encompasses all other scopes.
- Perform requests at any time (refresh_token, offline_access). Allows a refresh token to be returned when the requesting client is eligible to receive one. With a refresh token, the app can interact with the user’s data while the user is offline. 
- Access Visualforce applications (visualforce)
- Manage user data via Web browsers (web). Allows use of the access_token on the web. This scope also includes visualforce, allowing access to customer-created Visualforce pages.
- Access chatbot services (chatbot_api). Einstein Bot API services.

**Identity URLs**
The identity URL is the gateway to the Salesforce Identity Service that can be accessed using the OAuth 2.0 user-agent or web server flows. The connected app can then send a GET request with the access token to the identity URL. In response, Salesforce returns details about the queried user and org.

**OAuth Endpoints** are the URLs that you use to make OAuth authorization requests to Salesforce. Each OAuth flow defines which endpoints to use and what request data to provide.

### [Connected App and OAuth Terminology](https://help.salesforce.com/s/articleView?id=sf.remoteaccess_terminology.htm&type=5)
- Access Token - use instead of SF credentials
- Authorization Code. Only used in OAuth 2.0 with the web server flow, the authorization code is a token that represents the access granted by the end user.
- Callback URL - URL that is invoked after OAuth authorization for the consumer (connected app). May be not used.
- Consumer Key - to identify consumer to Salesforce.
- Consumer Secret - to establish ownership of the consumer key. 
- Nonce - random number, used during authorization to ensure that requests cannot be reused.
- Token Secret - to establish ownership of a given token, both for request tokens and access tokens.

### [Connected App Basics] (https://trailhead.salesforce.com/content/learn/modules/connected-app-basics)

See [Build Integrations Using Connected Apps at salesforce-integration-architect-notes.md](../salesforce-integration-architect/salesforce-integration-architect-notes.md) notes.

### [Build a Connected App for API Integration](https://trailhead.salesforce.com/content/learn/projects/build-a-connected-app-for-api-integration)

Hands-on project.

### [Configuring SAML SSO for a Canvas App](https://developer.salesforce.com/docs/atlas.en-us.sso.meta/sso/sso_examples_canvas.htm?_ga=2.77087517.944693519.1655603644-742205375.1652543223)
*The link leads to the general SSO article*
[The more appropriate link to SAML SSO for a Canvas app](https://developer.salesforce.com/docs/atlas.en-us.238.0.platform_connect.meta/platform_connect/canvas_app_saml_sso_intro.htm)

SAML SSO enables you to give your users automatic authentication into your canvas app via SAML and authentication into Salesforce via the signed request. You can create a canvas app that begins a standard SAML authentication flow when opened by a user. After this process completes, the user is authenticated into your Web application.

For canvas apps that use **signed request authentication**, two methods that are included in the Canvas SDK enable your canvas app to call into Salesforce to receive a new signed request directly or enable Salesforce to repost the signed request to your Web application endpoint. This results in a complete end-to-end authentication flow.
- `refreshSignedRequest` Method
  - Returns a new signed request via a callback. After the SAML SSO process is completed, your app can call this method and receive a new signed request.
  - For developers who need to retrieve the signed request by using a more client-side JavaScript approach.
- `repost` Method
  - Requests the parent window to initiate a POST to your canvas app and reloads the app page with a refreshed signed request. After the SAML SSO process is completed, your app can call this method and a new signed request is sent to your app via a POST.
  - For developers who want to retrieve the signed request using a more server-side approach. 

## Access Management Best Practices
Exam Weight: 15%

### [Security Basics](https://trailhead.salesforce.com/content/learn/modules/security_basics)

Basic Attack Methods:
- Phishing - Attempting to acquire sensitive information by masquerading as a trustworthy entity. 
- Malware - downloading malicious software (malware)
- Social Engineering - Manipulating people into taking action or revealing confidential information.
- Tailgating
- Eavesdropping
- Dumpster Diving
- Installing Rogue Devices

**Health Check** is set up to automatically measure your org's security against the Salesforce baseline (called Stand Values in the tool), but you can also import your own baseline for a more customized view of security. These are called **Custom Baselines** in the tool and you can add them by simply importing an XML file. 
If you run a Salesforce environment with multiple orgs, you can use the power of Health Check across all of your orgs with Salesforce's **Security Center** (add-on)

### [Journey to MFA: Launch Multi-Factor Authentication](https://salesforce.vidyard.com/watch/O3rQLAtVX0Z4lLjdOvVFYQ?_ga=2.12528828.944693519.1655603644-742205375.1652543223)
Vidyard video clip ~ 5min

### [Lightning Login Overview (Lightning Experience)](https://salesforce.vidyard.com/watch/Pk8QwpPk9QguuzZPtVh5dR?_ga=2.8283066.944693519.1655603644-742205375.1652543223)
Vidyard video clip ~ 2min

### [Multi-Factor Authentication](https://help.salesforce.com/s/articleView?id=sf.security_overview_2fa.htm&type=5)

If you haven’t satisfied the MFA requirement, be aware that in the future Salesforce is automatically enabling and enforcing MFA for all direct UI logins.

Use the **Waive Multi-Factor Authentication** for Exempt Users user permission before MFA is enabled for your org.

Enable MFA:
- For an entire org: Setup -> Identity Verification -> select Require multi-factor authentication (MFA) for all direct UI logins to your Salesforce org
- The setting above can be set per pofiles and permission sets and assigned to specific users

You can use the MFA functionality provided by Salesforce rather than your SSO identity provider’s MFA service -> require a High Assurance session security level on user profiles and configure the session security level for your SSO login method to produce a Standard session.

For connected apps, only the OAuth 2.0 refresh token flow, web server flow, and user-agent flows support using API logins with the high assurance MFA session security level. All other OAuth flows, such as the JSON Web Token (JWT) bearer token flow, block API logins with the high assurance MFA session security level