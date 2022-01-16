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