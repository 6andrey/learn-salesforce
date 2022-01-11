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
