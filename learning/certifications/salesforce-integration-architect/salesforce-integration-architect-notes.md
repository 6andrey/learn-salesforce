# Architect Journey: Integration Architecture

### Recommendations from the learner
- Pay attention to the business case examples that can be found on the trailmix's trailhead modules as well as Salesforce help articles. These notes don't include examples.  
- Learn the differences between various APIs.
- Learn when syncronous vs. asyncronous integration needed.
- Pay attention to what integration tools needed for work with gateways, firewalls, etc.


## Evaluate Current System Landscape
- Exam Weight: 8%
### [Measure Performance for Your Salesforce Org](https://help.salesforce.com/s/articleView?id=sf.technical_requirements_measuring_ept.htm&type=5)

*Plan Your Performance Test and Identify Key Personas*:
- Create an accurate sandbox and plan your test using key personas. Full copy sandbox recommended.
    - Draw a system diagram to show current and future state, and users. For each part estimate peak, average load levels and feature use. Consider user arrival, login rates, which pages are viewed, and page views per session.
    - Estimate the size and shape of your data.
    - In the sandbox, include any complex relationships, role hierarchies, and sharing rules.  
`Don't use sandbox as a benchmark of production performance and vice versa`  
Identify the key personas for the org and plan test around their workflows.

- Set Up and Run Performance Tests
Create test that evaluate your networks, key personas, and data loading.  
Prior to that measure your [browser octane score](https://help.salesforce.com/s/articleView?id=sf.console2_technical_requirements.htm&type=5). To run the test, append speedtest.jsp to your org’s domain:  
``https://MyDomainName.lightning.force.com/speedtest.jsp``  
Resolve any performance issues before testing the org.  
Define scope for each test, components, metrics. Run tests multiple times, at regular intervals.  

Performance is measured in **Experienced Page Time**:
- Add an EPT counter to the header of your app  
`https://MyDomainName.lightning.force.com/one/one.app?eptVisible=1`
- Use the Lightning Usage App to view page and browser performance
- Build a custom report using Lightning Usage App objects
- Use the Event Monitoring Analytics App to monitor performance with event types  
Also use browser developer tools to test performace.

### [Congratulations! You Inherited a Mature Org...Now What?](https://www.salesforce.com/video/1770820/)
*Org Assessment*
- Internal
    - The core
        - OWD
        - Sharing Settings
        - Record Types
        - Page Layouts
    - Users
        - Users
        - Profiles
        - Permission Sets
        - Communities
        - Roles
- External
    - Installed Apps
    - Integrations

### [Analyzing Your Org with Salesforce Optimizer](https://admin.salesforce.com/blog/2017/analyzing-org-salesforce-optimizer-webinar-recap)

### [Salesforce to Salesforce](https://help.salesforce.com/s/articleView?id=sf.business_network_intro.htm&type=5)
Share records and get updated data on shared records.  
*Available in Classic*  
- Enable SF to SF
    - When enabled in Setup, Connection User is created with Partner Network profile.
- Connect with you partners using the Connection Finder
    - Enable, find out orgs that have Salesforce, Invite partners, Accept an invitation
- Publish/subscribe objects, fields
- Share records from SF to SF
    - Forward, accept (manually/automatically)

### [Explore Integration Patterns and Practices](https://trailhead.salesforce.com/en/content/learn/trails/explore-integration-patterns-and-practices?trailmix_creator_id=strailhead&trailmix_slug=architect-integration-architecture)

**Prerequisites to the trail:**  
  
>[Salesforce & Heroku Integration](https://trailhead.salesforce.com/en/content/learn/modules/salesforce_heroku_integration)  
>
>Reasons to integrate apps on Heroku:
>- data replication
>    - for data warehousing to enable cross-source reporting and analysis
>    - to work with legacy systems
>    - to provide high throughput, low latency interface for customer facing apps
>- data proxies
>    - different data stores aggregated, but data isn't stored - data read only on demand
>    - for data science, BI, reporting
>    - faster than ETL (extract, transform, and load)
>- custom UIs
>    - can use VF, LWC, 
>    - open source like Java, Node.js can run on heroku and be integrated into SF UI
>    - legacy or external systems can provide UI that can be surfaced in SF
>- external processes
>    - can offload batch processes of trigger handling  
>
>Integrations methods:
>- Heroku Connect
>    - data replication and data proxies
>    - Heroku Postgres DB
>    - one way or bi-directional
>    - OData protocol and OData wrapper (RESTful endpoints)
>    - a developer simply writes SQL (not SOQL) queries
>- Salesforce Connect
>    - pull OData or other sources to SF on demand
>    - no data is copied into SF DB
>    - Heroku Connect can expose Heroku Postgres to be comnsumed by SF Connect
>    - custom adapters allow Salesforce to proxy any data that Apex can operate with (XML, JSON, REST, SOAP)
>    - Better than traditional ETL methods because the data is alaways in sync (retrtieved in near real-time and copied)
>- Salesforce REST APIs
>    - provide apps on Heroku access to Salesforce using JSON formatted HTTP requests
>    - can be used for data proxies or custom UIs
>- Callouts
>    - from SF to call external processe on Heroku
>- Canvas
>    - load external UI to Salesforce that can interact with SF data using JS API
>
>General suggestions for integrations:
>- To replicate data between Salesforce and Heroku, use Heroku Connect.
>- To expose a Heroku Postgres database to Salesforce, use Heroku Connect External Object.
>- To proxy OData, SOAP, XML, or JSON data sources into Salesforce, use Salesforce Connect.
>- If Heroku Connect doesn’t fit the bill, like when you have a custom UI on Heroku where users log in via Salesforce, use the Salesforce REST APIs.
>- To offload or extend the processing of Salesforce data events, use callouts from Salesforce to Heroku.
>- To embed a custom UI from Heroku (or other external web app) into Salesforce, use Canvas.  
>  
>- [API Planning Framework for Architects](https://trailhead.salesforce.com/en/content/learn/modules/design-with-the-right-api)  
>  
>| API Name          |   Protocol    |   Data Format |   Communication  |
>|-------------------|---------------|---------------|------------------|
>| REST API          |   REST        |   JSON, XML   |   Syncronous     |
>| SOAP API          |   SOAP(WDSL)  |   XML         |   Sync           |
>| Chatter REST API  |   REST        |   JSON, XML   |   Sync (Photos Async) |
>| UI API            |   REST        |   JSON        |   Sync    |
>| Analytics         |   REST        |   JSON, XML   |   Sync    |
>| Bulk API  |   REST    |   CSV, JSON, XML  |   Async   |
>| Metadata API  |   SOAP(WDSL)  |   XML |   Async   |
>| Streaming API |   Bayeux      |   JSON    |   Async   |
>| Apex REST API |   REST    |   JSON, XML, Custom   |   Sync    |
>| Apex SOAP API |   SOAP(WDSL)  |   XML |   Sync    |
>| Tooling API   |   REST or SOAP(WDSL)  |   JSON, XML, Custom   |   Sync    |
>  
>**API Planning Framework**:
>1. **UX**: What is the end user experience? What does developer need?  
>    - Define the end user experience:
>        - Who is the end user?
>        - What will be the primary use case in which the end user will utilize your solution?
>        - What service level agreements need to be met to enable a good experience?
>        - What channels will your end user need to access the solution?
>    - Define the developer experience:
>        - Are there any technical dependencies to other tools?
>        - What kind of outcomes are you striving for with your solution?
>        - What are the other Salesforce solutions and systems that are in scope of your project?
>        - What format is the data in?
>        - Are you dealing with a client-side or server-side enabled experience?  
>2. **Objects and records**: What data you working with?
>3. **Operations**: 
>    - What are you trying to do with the data?
>        - What is the source of truth for data structures?
>        - What volume of data are you working with?
>        - What direction is the data flowing as the end user consumes your solution?
>        - What data is being written to the database and at what time?
>    - What type of operation you’re needing from an API?
>        - How many records will the operation execute on?
>        - Should the operation run in a synchronous or an asynchronous mode?
>        - Should operations execute individually, in a batch, or in a bulk workload?
>        - What happens when the transactions the operation executes fails?
>        - How does the execution and performance of these operations impact the end user experience?
>4. **Growth and scale**: How does your integration scale with the growth of the dataset?
>    - What is the processing threshold for the resources you’re using?
>    - What success metrics should you use to define growth?
>    - How is the system tested throughout the ALM process?
>5. **API limits and allocations**: How many API resources are your resources using?
>    - `sfdx force:limits:api:display -u [alias or username]`  
>
>**End of prerequisites to the trail**  

**Common types of integration initiatives for the Salesforce Lightning Platform**
| Integration Initiative | Description |
|---|---|
| Application Integration | This category focuses on extending features and functionality across systems. This includes UI-triggered events, API integrations, flows, and connectors. |
| Data Integration | This category focuses on data integration and synchronization between two or more systems. This includes aspects of data integrity, data governance, data flow-design, and data migration. |
| Prtocess Integration | This category focuses on extending business processes and services across systems. This includes integration solutions such as events that trigger activity from one system or run transactions between two systems. |

**Salesforce Lightning Platform Integration Patterns**  
| Lightning Platform Pattern | Layer | Timing | Description |
|---|---|---|---|
| Remote Process Invocation — Request and Reply | Business Logic | Sync | Salesforce invokes a process on a remote system and the system then waits for a reply. |
| Remote Process Invocation — Fire and Forget | Business Logic | Async | Salesforce invokes a process in a remote system but doesn’t wait for completion of the process. |
| Batch Data Synchronization | Data | Async | When data is updated in an external system or on the Salesforce Lightning Platform, the updates are reflected in either system. Updates are applied in a batch manner. |
| Remote Call-In | Business Logic | Sync or Async | A remote system creates, retrieves, updates, or deletes data stored in Lightning Platform. |
| Data Virtualization | Data | Sync | Salesforce accesses external data in real time. |
| High-Frequency Data Replication | Data and UI | Sync or async | A source system asynchronously replicates data to a target system in near–real time at high scale. |
| Publish/Subscribe | Data and Business Logic | Async | Salesforce publishes an event (such as a record created, changed, deleted, and so on) with no knowledge of who may be on the receiving end. Any number of subscribers listen for these events and process them accordingly. |

**Layer Approach for application integration**  
Review each dimension and compare the results against your integration requirements:
- **Layers** - the different types of tasks in the system
- **Volume** - The amount of data synched and the transformation activity between systems. 
- **Timing** - Communication timing is either asynchronous or synchronous, where data flows between systems in real time (or as soon as possible) or is batched up for later delivery
- **Direction** - The source direction, which can be from Salesforce to another system, from another system to Salesforce, or bidirectional
Each *layer* represents a division of tasks in the system:
- User interface layer - Identify components to intgrate third-party web apps into Salesforce
    - Salesforce Canvas
    - Lightning Out
- Business process layer - the business logic includes data interaction, validation, and processing data transdactions
    - Mulesoft Anypoint Platform
    - Platform Events Bus (incl. Streaming API)
    - Flows
    - Outbound Messaging
- Data layer - it maps and identies primary data sources and connections to other segments of the system. Data transformations, migration, replication
    - Heroku Connect
    - Salesforce Connect
    - Apex
    - REST and SOAP API
    - Composite API
    - Bulk API

**Security Requirements**  
Integration patterns that follow Salesforce -> System pattern benefit from incorporating *Shield Platfrom Encryption*  
**Error Handling and Recovery**  
- Error Handling - when an error occurs, the caller manages error handling
- Recovery - changes aren't committed to Salesforce until the caller recieves the successful response  

**Coupling**  
Each solution relies on different dependencies across systems:
- technology requirements
- data type requirements
- interaction style (sync vs. async, and timing)
Looseley coupled solutions have ability to be swithced out if a requiremernt or dependency change.  

**Evaluate Integration Pattern**  
Request and Reply Example  
- Layer - Business Logic
- Timing - Syncronous
- Direction - Salesforcd -> System
- Volume - Ideal for small transactions (real-time)

**Idempotent Design Considerations**
To avoid sending multiple duplicate requests (a user clicks a button multiple times):
- Add a unique message ID to the request message. This helps the receiver recognize duplicate requests.
- Check for duplicate records before inserting data into the external system.

[Integration Patterns Overview](https://developer.salesforce.com/docs/atlas.en-us.integration_patterns_and_practices.meta/integration_patterns_and_practices/integ_pat_intro_overview.htm)  
  
**Connectors for Data Integration**  
  
***Mulesoft Salesforce Connector***  
Salesforce Connector can be used by a Mule App to connect to and from Salesforce or other data sources. The processing logic happens within the Mule Integration App. The Mule App works as the go-between, avoiding point-to-point integrations, and *decoupling* the two systems.  
  
***MuleSoft Database Connector***
Works alongside any Java Database Connectivity (JDBC) accessible database, including Postgres.  

***MuleSoft HTTP Connector***
Supports listening for and sending HTTP requests.  
  
***Heroku Connect***
Heroku Connect connects one or more Salesforce instances to a Heroku Postgres database using SOAP, Bulk, and Streaming APIs.  
  
***Salesforce Connect***  
Provides a method that creates external (temporary) objects that access real-time data coming from external platforms to Salesforce without having to store the data.

**API-led connectivity** spans across three layers—System APIs, Process APIs, and Experience APIs. Each of the layers are decoupled from one another.  
- **the system layer** is directly connected with external systems, for instance the database, legacy systems, or SaaS applications. Connecting to external systems is the only job of this layer.
- **the process layer** reads the data from the system layer. This is where the business logic and orchestrations are contained. 
- **the experience layer** is where the end user interacts with the data and processes. At this point, the user can modify the data and tailor it for their intended audience.  

From MuleSoft connectors to using Heroku Connect, integration connectors use Salesforce APIs via SOAP, Bulk, and Streaming. There are differences between each option when it comes to three key areas:
- DevOps and/or Administrative and Ongoing Integration Maintenance
- Functionality
- Licensing

**Factors Affecting Scale**
- Lack of Proper Bulkification - to improve
    - optimize trigger code
    - follow Apex best practices
    - ensure to use optimum batch sizes to improve bulkification, if using Bulk V1 (Salesforce times out batches that run more than 10 minutes)
    - consolidate multiple API calls into a single call using Composite APIs
- Lack of Governance
    - running multiple conflicting integrations
    - a poor data/sharing model
- Locking
    - avoid running conflicting updates to the same records in different threads
- Heavy Apex Post-Processing
    - verify that the Apex post-processing is minimized.

**Assessing the Integration You Need**  
- Source and Target - which system is initiating the integration and which system(s) is (are) integrated with the source
- Type - Is the integration at the presentation, business process, or data layer?
- Data Volume - number of rows of data, the size of the data
- Timing - sync or async
- Is it necessary to move the data?
- Is it a view-only requirement?
- How often does the data need to be moved?
- Which object will be used?
- What is the volume of data per hour and at its peak?
- What is the total anticipated volume?

**Mitigate Failing Data Loads**

***Anti-Patterns*** are those common solutions that are ineffective. Initially these solutions look appropriate, but in actuality the consequences outweigh the benefits. 
- No pre-assessment done to determine batch load times in sandbox
- Using SOAP API for nightly loads greater than 500,000
    - If you have 500,000 or more records to load, use Bulk API.
- Running batch Apex in parallel along with data loads
- Expecting a strict SLA for an asynchronous operation
- No performance assessment done for custom Lightning components before deployment
- Mimic org hierarchy for role hierarchy while creating temporary placeholder roles for the future
- Determine the max levels needed in Salesforce based on reporting needs.
- Use SOSL to implement custom search solutions by using global search with wildcards for large orgs
- Use reports without any proper filters in place
- Scope reports with date filters and indexed fields if possible
    - Prevent using not contains and not equal to with indexed fields
    - use relative date values in reports, for example this week, next week or next month
    - Avoid using formula fields in report filters
    - Equals is better than contains
- Use canned reports for common operations

### [Integration Architecture for the Salesforce Platform](https://developer.salesforce.com/blogs/developer-relations/2014/11/salesforce-integration-architecture)

The Integration Architecture Aligns the Business Strategy with Technical Capabilities.  
The Integration Architecture supports a Mix of Batch Processing and Real-time Services Middleware
- This means having multiple types of middleware at work.  
The Integration Architecture is Based Upon Business Service Level Agreements (SLAs)
- understand if and when to use asynchronous processing.
The Integration Architecture Has a Clearly Defined Standard for Applying Different Integration Use Cases

## Evaluate business needs
Exam Weight: 11%

### [Governance Basics](https://trailhead.salesforce.com/content/learn/modules/governance-basics?trailmix_creator_id=strailhead&trailmix_slug=architect-integration-architecture)

**Governance** is a framework for how organizations operate and make decisions.
Benefits of governance:
- Comliance - tech systems to comply with security ans/or regulatory requirements (system access, security, data privacy)
- Risk Assessment - evaluating and managing the risk
- Cost Effeciencies - to focus on things that produce most value
- Velocity - prirotization of new initiatives to focus on rights things and quickly adapt to business changes

Project key stakeholders:
- Information Technology
- Business Units
- End Users

Rolese and Responsibilities:
- Business side to own the project vision and strategy
- Business side to gather and prioritise requirements
- Business side to gather end-user feedback
- Business side to onboard users
- Business side to own and manage the budget
- Business side to designate product owner
- IT Side to build and maintaing systems
- IT Side to provide accurate estimates of effort
- IT Side to define the release schedule
- IT Side to test systems
- IT Side to support systems

Lean Governance Framework includes key processes
1. Vision and strategy. Vision is what you want to do, and strategy is how to do it. They should be reularly reviewed and updated.
2. Business backlog - is a complete list of prioritized business requirements. This process is owned by business units with support from IT
3. Software development lifecycle - technical governance for the release cadence, migration of new functionality between environments, QA testing
4. Data strategy, archtecture and management. Formalize integration strategy.
5. Communication strategy. Best practices to use: * involve leadership, * use various comm. channels, * reducd noise, * ensure comm. are valuable

Operating Models
- Centalized - a single governance framework with one set of processes and focused on one solution
- Decentralized - a federated framework with independent governance frameworks, different set of processes for different business units. For orgs that use multiole SF orgs
- Hybrid - common framework with each business unit having own autonomy

Core Committees
- Executive Steering Committee - owns overall vision and strategy, sets priorities and oversees overall project budget. The final escalation point.
- Project Management Committee - manages day to day details of all major projects

### [Key Principles for a Successful Salesforce Implementation Part III: Governance](https://medium.com/salesforce-architects/key-principles-for-a-successful-salesforce-implementation-part-iii-governance-b2a165f431c3)

**Explain The Value**  
When changing any process, explain the value of making the change in a way that means something to those affected. Also important to expalin senior leadership how change of an approach will affect business processes.  
**When and How to Govern**  
Transition from unprincipled to principled governance. Adding a 'principle checkpoint' into existing governance processes:
- Solution design - after requirement have been aligned to features and solutions
- Solution approval - before a solution design or statement of work
- Architectural reviews - during regular architecture group meetings
- Change management - before a release or change is approved for deployment

**Managing the Principle Lifecycle**  
Principles should not be changed often, however, adapting of business reuirements will to adapting of principles

## Translate needs to Integration Requirements
Exam Weight: 22%

### [Certificates and Keys](https://help.salesforce.com/s/articleView?id=sf.security_keys_about.htm&type=5)

Salesforce certificates and key pairs are used for signatures that verify a request is coming from your organization, re used for authenticated SSL communications with an external web site, or when using your organization as an Identity Provider. You only need to generate a Salesforce certificate and key pair if you're working with an external website that wants verification that a request is coming from a Salesforce organization.  

They can be exported into a keystore for storage or be import from a keystore. This allows you to move keys from one organization to another. The exported file is in Java Keystore (JKS) format. 

**API Client Certificate** is used by workflow outbound messages, the AJAX proxy, and delegated authentication HTTPS callouts. For security reasons, the API client certificate should be known only to your org.
Choose an API client certificate based on the remote endpoint you connect to. Some endpoint servers require a certificate chain that is trusted by a certificate authority; others are fine with directly trusting a self-signed certificate.
- **Generate a Self-Signed Certificate** signed by Salesforce to show that communications purporting to come from your organization are really coming from there.  
`Setup -> Certificate and Key Management -> Create Self-Signed Certificate`  
- **Generate a Certificate Signed by a Certificate Authority**  
`Setup -> Certificate and Key Management -> Create CA-Signed Certificate`  
Send the certificate request to certificate authority. After it's signed, upload the certificate...  
- **Set Up a Mutual Authentication Certificate** - to prevent security from being compromised by simple impersonation, you can require clients and servers to prove their identity to each other with a mutual authentication certificate.   
`Certificate and Key Management -> Upload Mutual Authentication Certificate`, Enable the `Enforce SSL/TLS Mutual Authentication` user permission for an `API Only` user. This “API Only” user configures the API client to connect on port `8443` to present the signed client certificate.  
A `certificate chain` is a hierarchical order of certificates where one certificate issues and signs another certificate lower in the hierarchy. Upload a certificate chain as a single PEM-encoded CA-signed certificate representing the concatenated chain of certificates. The uploaded certificate chain must include the intermediate certificates in the order: server or client certificate -> its signing certificate
- **Manage Master Encryption Keys** - Encrypted custom fields, such as Social Security Number or Credit Card Number, are encrypted with a master encryption key. This key is automatically assigned when you select fields to encrypt. You manage your own master key according to your organization’s security and regulatory needs.  

### [Configure Remote Site Settings](https://help.salesforce.com/s/articleView?id=sf.configuring_remoteproxy.htm&type=5)

Before any Visualforce page, Apex callout, or JavaScript code using XmlHttpRequest in an s-control or custom button can call an external site, that site must be registered in the Remote Site Settings page, or the call fails.  
`Setup -> Remote Site Settings -> New Remote Site`  

### [Build Integrations Using Connected Apps](https://trailhead.salesforce.com/en/content/learn/trails/build-integrations-using-connected-apps?trailmix_creator_id=strailhead&trailmix_slug=architect-integration-architecture)  
  
A **connected app** is a framework that enables an external application to integrate with Salesforce using APIs and standard protocols (SAML, OAuth, OpenID Connect) used to authorize, authenticate, and provide single sign-on (SSO) for external apps.  
  
**Benefits of using conected apps**:
- Access data with API integration - to pull data from your SF org. Several OAuth 2.0 authorization flows may be used depending on the type of connected app
- Integrate service providers with SF. E.g. when SF acts as identity provider. SAML 2.0. SF support SAML SSO. E.g. create a connected app with SAML, so SF is configured as identity provider, and users will be able to login into external app with SF credentials. A connected app may also be with OpenID Connect to integrate a service provider with SF (Service Provider must accepts OpenID tokens).
- Provide authorization to external API gateways - SF acts as independent OAuth authorization server. OpenID Connect dynamic client registration may be used to dynamically clent client apps as connected apps in SF. SF then can authorize those connected apps to access protected resource hosted by 3rd-part services.
- Manage access to third-party apps - e.g. to control what data 3rd-party has access from SF.
  
**Who does what**:
- Connected developer - builds API integrations or external apps that can access SF data as a connected app.
- Connected app admin - installs, uninstalls, blocks connected apps from SF org, configures permissions and policies.

**Access Data with API Integration**  
Connected app may be used to request access to SF data on the behalf of an external app. A connected app it needs to be integrated with the S API using the OAuth 2.0 protocol (an open protocol that enables authorization and secure data sharing between applications through the exchange of tokens). Developers use OAuth APIs to integrate their app with SF. These OAuth APIs enable a user to work in one app but see the data from another.

SF mobile app uses OAuth 2.0 authorization flow to get access to SF data.

***Connected App and OAuth Terminology***
- Access Token - can be used instead of user's SF credentials
- Authorization Code - token that represents access granted to the end user, used in OAuth 2.0
- Authorization Server - authorizes a resource owner and issues tokens
- Callback URL - invoked after OAuth authorization for the consumer (connected app)
- Consumer - website or app that uses OAuth to authorize SF user and itself
- Consumer Key - used by consumer to identify itself to Salesforce
- Consumer Secret - used by consumer to establish ownership of consumer key
- OAuth Endpoint - URL used to make authorization request to SF
- Nonce - number, often random, used during authorization
- Token Secret - secret used by a consumer to establish ownership of a given token

**Authorization for connected apps**  

A **connected app** to establich access to SF data using API has to use **OAuth 2.0 protocol**, that enabled authorization and data sharing between apps using tokens.  
  
1st authorization flow on mobile app:
1. Enter username and password
2. App send credentials to SF and initiates OAuth authorization flow
3. SF sends to the app access and refresh tokens
4. User approves request to grant access to the app
5. App starts

Ongoing authorization flow:
1. If the session is active, app starts immediately. If the session is stale, app uses refresh token to get updated session.
2. App starts.
  
**Web APP integration (OAuth 2.0 Web Server Flow)**  
To integrate external web app with SF API  
1. User clicks the external app. Connected app directs user to SF to authenticate and authorize the app to access SF data
2. The user approves the app access to data
3. SF sends a callback to the app with authorization code
4. The app passes the code to the SF token endpoint, requesting access token
5. SF validates the code, and sends back the access token
6. The app sends a request (with access token) back to SF to access the data
7. SF validates the access token and associates the scope
8. The app gets access to protected data
  
**Mobile app integration (OAuth 2.0 User-Agent Flow)** (using SF mobile SDK)
1. Connected app directs the user to SF to authenticate and authorize the mobile app
2. The user approves access for the authorization flow
3. The app receives callback from SF to redirect URL, which extracts access and refresh tokens
4. The connected app uses access token to access data on user's behalf

**Server to server integration (OAuth 2.0 JWT Bearer Flow)**  
*JWT - Jason Web Token*  
1. The connected app sends the JWT to SF token endpoint
2. SF validates JWT based on signature using a previously configured certificate and additional parameters
3. SF issues an access token
4. The connected app uses the access token to access the protected data in SF
  
**Integrate Service Providers with Salesforce**  
  
Identity provider vs. service provider:
- Identity provider - A trusted service that enables users to access other external applications without logging in again.
- Servicde provider - A service that accepts identity on behalf of the external application from an identity provider.
  
**Integrate a Service Provider with SAML**  
A connected app, that implements SAML 2.0, can be used to intergrate a service provider with SF org for user authentication. Use it if your org already uses SAML.  
  
**Integrate a Service Provider with OpenID Connect**  
A connected app, that implements OpenID Connect, can be used to intergrate a service provider with SF org for user authentication. The service provider must accept OpenID Connect tokens. Unlike SAML, it adds an authentication layer on top of OAuth 2.0 to enable secure exchange of ID tokens that contain user informatioon with OAuth access tokens.  
  
**Provide Authorization for External API Gateways**  
  
**OpenID Connect Dynamic Client Registration and Token Introspection**  
Dynamic client registration enables resource servers to dynamically create client apps as connected apps.  
Token introspection allows all OAuth connected apps to check the current state of an OAuth 2.0 access or refresh token.  
  
### [**Secure Secrets Storage**](https://trailhead.salesforce.com/content/learn/modules/secure-secrets-storage?trailmix_creator_id=strailhead&trailmix_slug=architect-integration-architecture)  
  
**Secrets** are data that can be used to verify what privileges a user has in a given situation. E.g. Passwords and passphrases, Encryption keys, OAuth tokens, Payment information, such as credit card numbers and PINs used to authenticate a payment transaction, Social Security numbers, which can be used to verify individual identity.  
  
Protect secrets from:
- Standard Users
- External Users
- Admins (e.g. with Modify All Data permission)  
  
Store app secrets in Salesforce:
- Named Credential - URL of a callout endpoint and its required authentication parameters in one definition. 
    - Once created, you can replace URL references in your code with references to the named credentials, which results in cleaner, simpler, and more secure code, as it also allows to skip setting Remote Site Settings.
    - Admins, users with View All data, Modify All Data, Author Apex permissions have access named credentials
    - Named Credentials are supported in thse types of callout definitions: Apex callouts, External Data Source - SF Connect (OData 2.0, 4.0, Custom), External Services.
- Distributed Secrets - admin access can be prevented with creating managed packages
- Protected Custom Settings and Protected Custom Metadata Types
    - custom settings can be used to store sensitive information or secrets. Protected custom setting in managed package aren't visible for subscribing orgs through Apex or API
    - Custom metadata fields can be utilized for secret storage in a similar way to custom settings. For proper secrecy, set their visibility to ”Protected” and contain them within a managed package. Visibility can be: Public (local), Protected (local), Public (managed), Protected (managed). **Use Protected (managed) to store app secrets.**  
      
**Use protected custom settings when:**
- The secret needs to be updated frequently and must be available immediately. Since metadata types need to be enqueued and deployed, updated secrets in metadata types aren’t available right away. This makes a custom setting the better option here.
- You want to specify which profiles and users can access which secrets. Metadata types don’t offer the granularity of the custom settings hierarchy types, which allow you to specify to which profiles or users the secrets should be available. That’s why it is better to use a custom setting here.
  
**Use custom metadata types when:**
- You want to deploy a common secret without extra configuration steps.
- Custom metadata secrets can be easily migrated, for example, from a sandbox or dev environment to a production environment. Whereas in custom settings, admins need to either write postinstall scripts or create pages and manually enter and store secrets in the new environment.
  
**Apex Crypto Class** provides sets of functions that are particularly valuable for safeguarding your communications.  
- Encryption and Decryption to Protect Confidentiality (Crypto.Encrypt(); Crypto.Decrypt(); Crypto.generateAESKey(Integer keylength))
-  Hash Digests to Protect Integrity (Crypto.generateDigest())
- Hash-Based Message Authentication Codes (MACs) to Prove Authenticity and Integrity (Crypto.generateMac())
- Creating a Digital Signature - ensure both the integrity and authenticity (Crypto.sign())
  
### [Change Data Capture Basics](https://trailhead.salesforce.com/content/learn/modules/change-data-capture?trailmix_creator_id=strailhead&trailmix_slug=architect-integration-architecture)  
  
**Change Data Capture** is a streaming product on the Lightning Platform that enables you to efficiently integrate your Salesforce data with external systems in real time, publishes events for changes in Salesforce records corresponding to create, update, delete, and undelete operations. **Streaming events** are instant notification messages that one system (the publisher) sends to another (the subscriber).  
  
Change Data Capture **supports** change events for custom objects and the most popular standard objects including Account, Contact, Lead, User, Order, OrderItem, Product2, and others.  
  
Fields Included in the Body of a JSON Event Message:
- Create - the event message body includes all non-empty fields along with system fields such as the CreatedDate and OwnerId fields.
- Update - the body includes only the changed fields. It also includes the LastModifiedDate system field.
- Delete - the body doesn’t include any fields or system fields.
- Undelete - the body includes all non-empty fields from the original record, in addition to system fields.
  
**The order of the fields** in the JSON event message is not guaranteed. 
  
Change events can be enriched with selected fields, which will be send always (e.g. External Id).  
  
For apps external to Salesforce, you can use **Streaming API**, or tools and libraries based on **CometD**, an open-source library that simulates push technology. Streaming API provides a subscription mechanism based on CometD.  
  
Subscription Channels:
- Standard Channels
    - Standard Channel for Selected Entities - all selected objects - `/data/ChangeEvents`
    - Single-Entity Channels - `/data/<Standard_Object_Name>ChangeEvent` or `/data/<Custom_Object_Name>__ChangeEvent`
- Custom Channels - multiple subscribers and each subscriber receives change events from a different set of entities - `/data/YourChannelName__chn`
  
**Subscribe to Change Events Using an Apex Trigger**  
Like an Apex trigger for Salesforce objects, you define a change event trigger on the change event corresponding to the Salesforce object. Only after insert triggers are supported.  
`trigger TriggerName on ChangeEventName (after insert) {}`  
  
Change event triggers run **asynchronously** after the database transaction is completed.
- They run under the Automated Process entity.
- They are subject to Apex synchronous governor limits.
- They have a maximum batch size of 2,000 event messages.
  
**Testing Change Event Trigger**  

```
@isTest static void testChangeEventTrigger() {
    // Enable all Change Data Capture entities for notifications.
    Test.enableChangeDataCapture();
    // Insert one or more test records
    // ...
    // Deliver test change events
    Test.getEventBus().deliver();
    // Verify the change event trigger’s execution
    // ...
}
```
**Differences Between Platform Events and Other Streaming Events**
Other events include **PushTopic** and generic events. With PushTopic events, clients receive messages about changes in Salesforce records based on a predefined query. With generic events, you can send and receive arbitrary message content (payloads) not necessarily tied to Salesforce records. Platform events are similar to generic events but offer more powerful customization. With platform events, you can publish any custom data. You define the schema of event data at a granular level as typed fields. Also, you can use platform events in native Salesforce platform apps and external apps alike. Use platform events in the following cases:

To send and receive custom event data with a predefined schema
To publish or subscribe to events in Apex
For the flexibility of publishing and processing events on and off the Salesforce platform

## Design Integration Solutions
Exam Weight 28%  
  
### [Integration Patterns and best practices](https://developer.salesforce.com/docs/atlas.en-us.integration_patterns_and_practices.meta/integration_patterns_and_practices/integ_pat_intro_overview.htm)  
  
**Integration Patterns**  
Strategies' description (in the form of patterns) for common integration scenarios.  
  
**Pattern Template**:
- Name
- Context
- Problem
- Forces - The constraints and circumstances that make the stated scenario difficult to solve.
- Solution
- Sketch - A UML sequence diagram that shows you how the solution addresses the scenario.
- Results
- Sideboards - Additional sections related to the pattern that contain key technical issues, variations of the pattern, pattern-specific concerns, and so on.
- Example
  
**List of Patterns**  
  
| Pattern | Context | Problem | Forces | Solution (best) | Sketch / Results / Sideboards / Example |
|---|---|---|---|---|---|
| Remote Process Invocation—Request and Reply | Orders created in SF, then created in remote system for managing  | How to initiate process in the remote, pass infor to it, receive response data | * Sync or async? * Sf to process response from remote? * Message size? * Event - UI or DML? Latency? | * Enhanced External Services invokes a REST API call * SF Lightning—Lightning comp or page initiates a sync Apex SOAP or REST callout * VF or button initiates a sync Apex HTTP callout | [Link](https://developer.salesforce.com/docs/atlas.en-us.integration_patterns_and_practices.meta/integration_patterns_and_practices/integ_pat_remote_process_invocation_state.htm) |
| Remote Process Invocation—Fire and Forget | Orders created in SF, then created in remote system, but SF doesn't wait for response | How to initiate process in the remote, pass infor to it, without waiting for response? | * Sync or async? * Sf to process response from remote? * Message size? * Event - UI or DML? Is guaranteed msg delivery a requirement? | * Process-driven platform events | [Link](https://developer.salesforce.com/docs/atlas.en-us.integration_patterns_and_practices.meta/integration_patterns_and_practices/integ_pat_remote_process_invocation_fire_forget.htm) |
| Batch Data Synchronization | Movin CRM into SF with initial and ingoing import and ongoing export | How to import/export large amount of data?.. | Should data stored in SF?  * Shoukd datas be refreshed in response event from remote? On schedule? A=Reporting requirements? | * Salesforce Change Data Capture * Replication via third-party ETL tool | [Link](https://developer.salesforce.com/docs/atlas.en-us.integration_patterns_and_practices.meta/integration_patterns_and_practices/integ_pat_batch_data_sync.htm) |
| Remote Call-In | Capture orders in SF but process in remote | How remote connects and auth w. SF? | Remote call to notify SF or perform CRUD ops? * Single or multiple objects? * Msg format? * Transaction processing? | SOAP or REST API | [Link](https://developer.salesforce.com/docs/atlas.en-us.integration_patterns_and_practices.meta/integration_patterns_and_practices/integ_pat_remote_call_in.htm) |
| UI Update Based on Data Changes | Real time data update from remote in SF | How user notified on event in SF w/o refresheing screen? | * Data persistence in SF? * User access to invoke custom UI? | Streaming AP | [Link](https://developer.salesforce.com/docs/atlas.en-us.integration_patterns_and_practices.meta/integration_patterns_and_practices/integ_pat_ui_updates_from_data_changes.htm) |
| Data Virtualization | Orders are managed by remote but users want to view and update real-time info in SF | How to view, serach and update data not stored in SF w/o moving data into SF? | * Declarative outbounf integration or UI mashup? * Amount of data? Real-time access? Remote is clousd or back-office? | Salesforce Connect | [Link](https://developer.salesforce.com/docs/atlas.en-us.integration_patterns_and_practices.meta/integration_patterns_and_practices/integ_pat_data_virtualization.htm) |
  
Integration Pattern Categories:
- Data Integration - to sync data that resides in 2+ systems
- Process Integration - business process to leverage 2+ apps to complete tasks
- Virtual Integration - user to view, search, and modify data stored in external system
  
**Pattern Selection Guide**  
Pattern Category (above) + timing (sync / async)  
  
Integrating SF with external system
- Process Integration + Sync = Remote Process Invocation - request and Reply
- Process Integration + Async = Remote Process Invocation - Fire and Forget
- Data Integration + Sync = Remote Process Invocation - request and Reply
- Data Integration + Async = UI Update Based on Data Changes
- Virtual Integration + Sync = Data Virtualization
  
Integrating external system with SF
- Process Integration + Sync / Async = Remote Call-In
- Data Integration + Sync = Remote Call-In
- Data Integration + Async = Batch Data Syncronization
  
**Middleware Terms and Definitions**  
- Event Handling - the receipt of an identifiable occurrence at a designated receiver (“handler”).
- Protocol Conversion - typically a software application that converts the standard or proprietary protocol of one device to the protocol suitable for another device to achieve interoperability.
- Translation and transformation - the ability to map one data format to another to ensure interoperability between the various systems being integrated.
- Queuing and buffering - generally rely on asynchronous message passing, as opposed to a request-response architecture.
- Synchronous transport protocols - refer to protocols that support activities wherein a “single thread in the caller sends the request message, blocks to wait for the reply message, and then processes the reply.
- Asynchronous transport protocols - refer to protocols supporting activities wherein “one thread in the caller sends the request message and sets up a callback for the reply.
- Mediation routing - the specification of a complex “flow” of messages from component to component
- Process choreography and service orchestration - forms of  “service composition” where any number of endpoints and capabilities are being coordinated.
- Transactionality - the ability to support global transactions that encompass all necessary operations against each required resource. Transactionality implies the support of all four ACID (atomicity, consistency, isolation, durability) properties.
- ETL - Extract, transform, and load.
- Long polling - Comet programming, emulates an information push from a server to a client.
  
### [Outbound Messaging](https://developer.salesforce.com/docs/atlas.en-us.api.meta/api/sforce_api_om_outboundmessaging.htm)  
Outbound messaging is part of the workflow rule functionality in Salesforce.  
  
Outbound messaging uses the `notifications()` call to send SOAP messages over HTTP(S) to a designated endpoint when triggered by a workflow rule. A single SOAP message can include up to 100 *notifications*. Each notification contains the object ID and a reference to the associated *sObject* data. Calls cna be batched into 1+ SOAP messages. Messages can be queued until sent successfully or 24 hours old. If a messages can't be delivered, the interval increases exponentially up to 2 hours. Messages may be delivered out of order.
    
Instead of polling, the outbound messaging can be used to trigger execution logic when SF raises an event.  
  
### [Canvas Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.platform_connect.meta/platform_connect/canvas_framework_intro.htm#!)  
**Canvas** is a set of tools and JavaScript APIs that you can use to expose an application as a canvas app. The third-party app that you want to expose as a canvas app can be written in any language. The only requirement is that the app has a secure URL (HTTPS).  
  
**Canvas Scenarios**  
- Application integration — to integrate cloud applications with Salesforce.
- Application rationalization/enterprise desktop — to integrate existing apps into Salesforce so that users can accomplish all of their tasks in one place.
  
## Build Solution
Exam Weight 23%  
  
### [API-Led Integration for Business Reinvention](https://trailhead.salesforce.com/content/learn/modules/api-led-integration-for-business-reinvention?trailmix_creator_id=strailhead&trailmix_slug=architect-integration-architecture)  
  
(some inspiring text not worth taking notes)  

### [Access External Data With Salesforce Connect](https://help.salesforce.com/s/articleView?id=sf.salesforce_connect.htm&type=5)
View, search, and modify data that’s stored outside your Salesforce org.  
  
Salesforce Connect maps Salesforce external objects to data tables in external systems. Use Salesforce Connect when:
- You have a large amount of data that you'don't want to copy into SF org.
- You need a small amount of data at any one time.
- You want real-timne access to the latest data.
  
External Objects are available to:
- Global search
- Lookup relationships
- Record feeds
- SF mobile app
- Apex, SOSL, SOQL, SF APIs
- Deployment through Metadata API, change sets, and packages
  
SF Connect Adapters:
- Cross-org - uses Lightning Platform REST API to connect between SF orgs
- OData 2.0, OData 4.0 - uses Open Data Protocol
- Custom adapter created via Apex - uses the Apex Connector Framework
  
SF Connect requires add-on license(s). Each License includes 5 cross-org and 1 Odata or custom adapter connector.  
  
| General Limits for Sf Connect||
|---|---|
| Max external objects per org (regardles of how many licenses purchased) | 200 |
| Max joins per query across external objects and other types of objects| 4 |
| Ma length of the OAuth token issued by external system| 4,000 chars |
| Max new rows retrieved by SOSL and SF searches per hour | 100,000 |
| Max new rows retrieve or crated per hour (doesn't apply to high-data volume external data sources, search result that aren't opened or edited, other roes that have been already retrieved) | 100,000 |
| Max page sixe for server-driven paging | 2,000 rows |
  
| Callout Limits ||
|---|---|
| Cross-org adapter| No call-out limits, but each call-out counts toward API limits |
| OData | 20,000 call-outs per hr for Enterprise, Performance and Unlimited. 1,000 for Developer |

On the external data source configured for Salesforce Connect, the **Identity Type** field specifies whether your organization uses one set or multiple sets of credentials to access the external system. Each set of credentials corresponds to a login account on the external system.  
| To access the external system's | The system uses the credentials that are difined in... | The system uses the credentials that are difined in... |
|---|---|---|
| Data | External dasta source definition | User's personal auth settings for the external system|
| Metadata | External dasta source definition | External data source definition |
  
When you validate and sync an external data source, it creates or overwrites Salesforce external objects that map to the external system’s schema. Syncing doesn’t copy any data into your Salesforce org or write data from your org to the external system.  
  
External objects behave similar to custom objects except that they map to data stored outside Salesforce in an external data source. Each external object maps to a data table, and the object fields map to accessible table columns.  

Features not supported with External Objects:
- Set up Data with External Objects
    - Merge Fields
    - Schema Builder
    - Validation Rules
    - Custom fields - Field types not supported: Auto-Number (available only with the cross-org adapter for SF Connect), Currency (available only with the cross-org adapter for SF Connect), Formula, Geolocation, Master-Detail Relationship, Picklist and Picklist (Multi-select) (available only with the cross-org adapter for SF Connect), Roll-up Summary, Text (Encrypted), Text Area (Rich)
    - Lookup filter on relationship fields
    - Default field values
- Record-level security to manage data access for external objects
- Record types to customize external data
- Productivity Tools
    - Activities, Events, and Tasks
    - Attachments
    - Notes

The first time a data row is retrieved from an external system, the external object record is assigned a Salesforce ID. Each record ID remains associated with the same external data row, unless the external object is deleted from the org.  
Select **Writable External Objects** when you define an external data source and use Salesforce Connect external objects to create, update, and delete data. External objects are read only by default.  
  
SF Platform features support by SF Connect:
- Reports - Depending on network latency and the availability of the external system, reports that include an external object can take a long time to run.
- Record Feed - View the Chatter feed associated with external object records you follow to see updates about the record. Following records helps keep you up to date on important changes to the external objects.
- Quick Actions - External objects support quick actions, except when the actions involve features or functionality that are incompatible with external objects.
- Flows and Processes - You can build flows and processes that include external objects and automate your organization’s repetitive business tasks.
- Salesforce App - You can view and search external objects from the Salesforce mobile app, Salesforce on the go!
- Salesforce Console - You can access external objects from the Salesforce console only in Salesforce Classic. Other consoles, such as the Salesforce console in Lightning Experience, aren’t supported.
- More Features Supported by Salesforce Connect - External objects are available to Salesforce APIs, SOQL queries, SOSL and Salesforce searches, SOQL queries, packages, Metadata API, change sets, and Lightning Experience app.  
  
An external data source specifies how to access an external system. **Salesforce Connect** uses external data sources to access data that's stored outside your Salesforce organization. **Files Connect** uses external data sources to access third-party content systems. External data sources have associated external objects, which your users and the Lightning platform use to interact with the external data and content.  
  
### [Large Data Volumes](https://trailhead.salesforce.com/content/learn/modules/large-data-volumes?trailmix_creator_id=strailhead&trailmix_slug=architect-integration-architecture)  
  
**Data skew** happens when more than 10,000 child records are associated with the same parent record within an org.  
Types of data skew:
- Account data skew
    - Record locking
    - Sharing issues
  - Ownership skew - can cause performance issues due to sharing calculations required to manage visibility
  - Lookup skew - large number of records assoc. with one record in the lookup object.
  
Types of relationships to external objects
| Realationship | Allowed Child Object | Allowed Parent Objects | Parent Field for Matching Records |
|---|---|----|---|
| Lookup | Standard / Custom / External | Standard / Custom | 18-char SF record ID |
| External Lookup | Standard / Custom / External | External | the External ID standard field |
| Indirect Lookup | External | Standard / Custom | You select a custom field w. External ID and unique attributes |

**SOQL vs. SOSL Queries** -  the governor limit for SOSL queries is 2,000; for SOQL queries it’s 50,000.  
**The Force.com query optimizer** maintains a table of statistics about the distribution of data in each index to perform pre-queries to determine whether using the index can speed up the query.  
You can query and process up to _50 million records_ using **Batch Apex**.  
A **bulk query** can retrieve up to _15 GB_ of data, divided into fifteen 1 GB files. If the query doesn’t execute within the standard two-minute timeout limit, the job fails and a **QUERY_TIMEOUT** error is returned.  
A **skinny table** is a custom table in the Force.com platform that contains a subset of fields from a standard or custom base SF object.
  
**Load Your Data**  
Loading Lean:
- Identifying the business-critical operations before moving users to SF
- Identifying the minimal data set and configuration required to implement those operations.
- Defining a data and configuration strategy based on the requirements you’ve identified.
- Loading the data as quickly as possible to reduce the scope of synchronization.
  
Consider these before loading data:
- OWD - Private Sharing Model will require more time to load then Public. If possible, load with Public and change to Private later.
- Complex object relationships - the more lookups the more checks to be done when loading. Try to minimize lookup and add some after the load.
- Sharing Rules - see above.
- Worflow rules, validation rules, and triggers - try to disable them during the massive data loads.
  
Using **Bulk API** for LDV allows for super-fast processing speeds, along with reduced client-side programmatic language, easy-to-monitor job status, automatic retry of failed records, support for parallel processing, minimal roundout trips to Force.com, minimal API calls, limited dropped connections, and easy-to-tune batch size.  
  
**Temporarily disabling triggers** is a little more complex and requires some preparation. First, create a Custom Setting and a corresponding checkbox field to control when a trigger should fire. Then include a statement in your trigger code like the one highlighted in this example.  
```
trigger setDefaultValues on Account (before insert, before update){
    Load_Settings__c s = Load_Settings__c.getInstance(UserInfo.GetUserID());
    if(s.Load_Lean__c) return; // Skip Trigger
...
}
```
Once this is done, disabling or enabling your trigger is as simple as editing the checkbox field.  
  
**PK (_Primary Key_) chunking** splits bulk queries on very large tables into chunks based on the record IDs of the queried records. Enable PK chunking when querying tables with more than 10 million records or when a bulk query consistently times out.  
**Truncating** a custom object erases all records currently sitting in the custom object’s Recycle Bin; the custom object’s history; and related events, tasks, notes, and attachments for each deleted record.  
  
### [Understanding Outbound Messaging](https://developer.salesforce.com/docs/atlas.en-us.api.meta/api/sforce_api_om_outboundmessaging_understanding.htm)  