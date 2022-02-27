# 5 Steps for building a user security model
1. **Define the personas** - groups of users with similar access rights.

    Types of personas:

        * Human users - accessing the platform using UI, logging in using identifier / password / SSO. *Internal* users
                        (business, admin), *external* users (communities / sites), or *unauthenticated* users.
        * Non-human users - integration, registration, record ownership, logging in via API, OAuth 2.0, JWT.

2. **Define fully locked down base profiles**

    Moving forward, use **permission sets / groups**. 

    Use profiles only for defining:

        * default record type
        * page layouts
        * IP ranges & login hours

3. **For each persona, extend access with permission sets / groups**

    One way to structure PS is on per-app basis, covering data access rights (objects & fields), assigned apps (incl. communities & connected apps), and access to tech. components (Apex, VF, flows, custom metadata types, & custom settings).

4. **Define the sharing model**

    All objects' default access should be set to minimum. OWD should be set to **Private** or **Controlled by Parent** for both internal and external users. Any standard objects that are not used should stay private.

5. **Account for specific access types**

    Some artifacts controlled only at the profile or permission level should also be considered as part of security model. Assto these should be done through permission sets:

        * External objects
        * Custom Settings
        * Custom Metadata Types
        * Apex
        * VF
        * Apps