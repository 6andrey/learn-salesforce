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

