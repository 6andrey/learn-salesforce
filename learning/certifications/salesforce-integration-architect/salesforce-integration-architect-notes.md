# Architect Journey: Integration Architecture

## Evaluate Current System Landscape
- Exam Weight: 8%
### [Measure Performance for Your Salesforce Org](https://help.salesforce.com/s/articleView?id=sf.technical_requirements_measuring_ept.htm&type=5)

*Plan Your Performance Test and Identify Key Personas*:
- Create an accurate sandbox and plan your test using key personas. Full copy sandbox recommended.
    - Draw a system diagram to show current and future state, and users. For each part estimate peak, average load levels and feature use. Consider user arrival, login rates, which pages are viewed, and page views per session.
    - Estimate the size and shape of your data.
    - In the sandbox, imnclude any complex relationships, role hierarchies, and sharing rules.  
`Don't use sandbox as a benchmark of production performance and vice versa`  
Identify the key personas for the org and plan test around their workflows.

- Set Up and Run Performance Tests
Create test that evaluate your networks, key personas, and data loading.  
Prior to that measure your [browser octane score](https://help.salesforce.com/s/articleView?id=sf.console2_technical_requirements.htm&type=5). To run the test, append speedtest.jsp to your org’s domain:  
``https://MyDomainName.lightning.force.com/speedtest.jsp``  
Resolve any performance issue before testing the org.  
Define scope for each test, components, metrics. Run tests multiple times, at regular intervals.  

Performance is measured in **Experinced Page Time**:
- Add an EPT counter to the header of your app  
`https://MyDomainName.lightning.force.com/one/one.app?eptVisible=1`
- Use the Lightning Usage App to view page and browser performance
- Build a custom report using Lightning Usage App objects
- Use the Event Monitoring Analytics App to monitor performance with event types  
Also user browser developer tools to test performace.

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
- Connect with you partners using the COnnection Finder
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
>    - data reolication and data proxies
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
>    - load external UI to Salesforce that can intercat with SF data using JS API
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
>**Enf of prerequisites to the trail**  

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
- Recovery - chnages aren't committed to Salesforce until the caller recives the successful response  
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
Salesforce Connector can be used by a Mule App to connect to and from Salesforce or other data sources. The processing logic happens within the Mule Integration App. he Mule App works as the go-between, avoiding point-to-point integrations, and *decoupling* the two systems.  
  
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
Principles should not chnage often, however, adapting of business reuirements will to adapting of principles

## Translate needs to Integration Requirements
Exam Weight: 22%

### [Certificates and Keys](https://help.salesforce.com/s/articleView?id=sf.security_keys_about.htm&type=5)

Salesforce certificates and key pairs are used for signatures that verify a request is coming from your organization. They can be exported into a keystore for storage or import certificates and keys from a keystore. This allows you to move keys from one organization to another. The exported file is in Java Keystore format.  

**API Client Certificate** is used by workflow outbound messages, the AJAX proxy, and delegated authentication HTTPS callouts. For security reasons, the API client certificate should be known only to your org.
Choose an API client certificate based on the remote endpoint you connect to. Some endpoint servers require a certificate chain that is trusted by a certificate authority; others are fine with directly trusting a self-signed certificate.
- **Generate a Self-Signed Certificate** signed by Salesforce to show that communications purporting to come from your organization are really coming from there.  
`Setup -> Certificate and Key Management -> Create Self-Signed Certificate`  
- **Generate a Certificate Signed by a Certificate Authority**  
`Setup -> Certificate and Key Management -> Create CA-Signed Certificate`  
Send the certificate request to certificate authority. After it's signed, upload the certificate...  
- **Set Up a Mutual Authentication Certificate** - to prevent security from being compromised by simple impersonation, you can require clients and servers to prove their identity to each other with a mutual authentication certificate.  
`Certificate and Key Management -> Upload Mutual Authentication Certificate`  
- **Manage Master Encryption Keys** - Encrypted custom fields, such as Social Security Number or Credit Card Number, are encrypted with a master encryption key. This key is automatically assigned when you select fields to encrypt. You manage your own master key according to your organization’s security and regulatory needs.  

### [Configure Remote Site Settings](https://help.salesforce.com/s/articleView?id=sf.configuring_remoteproxy.htm&type=5)

Before any Visualforce page, Apex callout, or JavaScript code using XmlHttpRequest in an s-control or custom button can call an external site, that site must be registered in the Remote Site Settings page, or the call fails.  
`Setup -> Remote Site Settings -> New Remote Site`  

### [Build Integrations Using Connected Apps](https://trailhead.salesforce.com/en/content/learn/trails/build-integrations-using-connected-apps?trailmix_creator_id=strailhead&trailmix_slug=architect-integration-architecture)  
  
A **connected app** is a framework that enables an external application to integrate with Salesforce using APIs and standard protocols used to authorize, authenticate, and provide single sign-on (SSO) for external apps.  
  
**Benefits of using conected apps**:
- Access data with API integration - to pull data from your SF org.
- Integrate service providers with your SF. E.g. when SF acts as identity provider.
- Provide authorization to external API gateways - SF acts as independent OAuth authorization server.
- Manage access to third-party apps - e.g. to control what data 3rd-party has access to in SF.
  
**Who does what**:
- Connected developer - builds API integrations or external apps that can access SF data as a connected app.
- Connected app admin - installs, uninstalls, blocks connected apps from SF org, configures permissions and policies.

**Access Data with API Integration**  
  
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
1. If the session is active, app starts immediately. If the sessio is stale, app uses refresh token to get updated session.
2. App starts.
  
**Web API integration (OAuth 2.0 Web Server Flow)**  
1. Connected app directs user to SF to authenticate and authorize the app to access SF data
2. The user approves the app access to data
3. SF sends a callback to the app with authorization code
4. The app passes the code to the SF token endpoint, requesting access token
5. SF validates the code, and sends back the access token
6. The app sends a request (with access token) back to SF to access the data
7. SF validates the access token and associates the scope
8. The app gets access to protected data
  
**Mobile app integration (OAuth 2.0 User-Agent Flow)** (using SF mobile SDK)
1. Conencted app directs the user to SF to authenticate and authorize the mobile app
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
A connected app, that implements OpenID Connect, can be used to intergrate a service provider with SF org for user authentication. The service provider must accept OpenID Connect tokens.  
  
**Provide Authorization for External API Gateways**  
  
**OpenID Connect Dynamic Client Registration and Token Introspection**  
Dynamic client registration enables resource servers to dynamically create client apps as connected apps.  
Token introspection allows all OAuth connected apps to check the current state of an OAuth 2.0 access or refresh token.  
  
  