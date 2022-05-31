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


