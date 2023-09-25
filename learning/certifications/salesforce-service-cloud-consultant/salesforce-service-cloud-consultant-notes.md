# [Salesforce Service Cloud Consultant](https://trailhead.salesforce.com/users/strailhead/trailmixes/prepare-for-your-salesforce-service-cloud-consultant-credential)

- [Salesforce Service Cloud Consultant](#salesforce-service-cloud-consultant)
  - [Industry Knowledge](#industry-knowledge)
    - [Service Cloud for Lightning Experience](#service-cloud-for-lightning-experience)
    - [Contact Center Leadership for Executives](#contact-center-leadership-for-executives)
  - [Implementation Strategies](#implementation-strategies)
  - [Service Cloud Solution Design](#service-cloud-solution-design)
  - [Knowledge Management](#knowledge-management)
    - [Knowledge Search Basics](#knowledge-search-basics)
  - [Interaction Channels](#interaction-channels)
    - [Social Customer Service Strategies](#social-customer-service-strategies)
    - [Service Cloud Agent Productivity](#service-cloud-agent-productivity)
    - [Omni-Channel for Lightning Experience](#omni-channel-for-lightning-experience)
    - [Artificial Intelligence for Customer Service](#artificial-intelligence-for-customer-service)
    - [Salesforce Mobile App Rollout](#salesforce-mobile-app-rollout)
    - [Salesforce Mobile SDK Basics](#salesforce-mobile-sdk-basics)
  - [Case Management](#case-management)
    - [Service Cloud Basics](#service-cloud-basics)
    - [Create a Process for Managing Support Cases](#create-a-process-for-managing-support-cases)
    - [Set Up Case Escalation and Entitlements](#set-up-case-escalation-and-entitlements)
  - [Contact Center Analytics](#contact-center-analytics)
    - [\[\]](#)

## Industry Knowledge

Exam Weight 10%

### [Service Cloud for Lightning Experience](https://trailhead.salesforce.com/content/learn/modules/service_lex)

General Service Cloud Setup Process:

1. Automate case management - route customer requests to correct users
   1. Queues - when agents works as a team
   2. Assignment Rules - when apply different levels of support, or based on skills, products
   3. Escalations Rules - cases not solved on time?
   4. Auto-response Rules
   5. Page layout editor, email templates, enititlement management, omni-channel, macros, quick text, utilities
2. Add multiple channels - phones, emails, websites, social media, etc.
3. Capture knowledge
4. Expand efiiciencies with AI (and bots)

### [Contact Center Leadership for Executives](https://trailhead.salesforce.com/content/learn/modules/contact-center-leadership-for-executives)

Contact Center Output Metrics:

- Information on the latest technology
- Reports on up-time and complaints from customers
- Financials around sales and revenue
- Earnings before tax (where and what those earnings are coming from)
- Costs
- Profit and margin
- How sales turn into real dollars
- Up-time reports
- Complaint logs

## Implementation Strategies

Exam Weight 15%

## Service Cloud Solution Design

Exam Weight 16%

## Knowledge Management

Exam Weight 9%

**Knowledge base** is a single repository of organizational information.

Designing knowledge base best practices:

- Create a record type for each different of information
- Use the Knowledge import tool to bring articles in from a different Knowledge base
- Define data category groups for each type of search filter or to detrmine which user profile sees the artivles for each categroy or group
- Add an approval process to a record type to ensure that required reviewers approve articles before it's published
- Determine what information to make available to each audience
- Create custom reports about article ratings. Review reports and articles regularly to keep them up to date
- See how many times an article is attached to cases and solve customers' issues
- Identify synonyms for search items

**Licensing**
Internal SF users don't need extra license to read Knowledge articles. **Lightning Knowledge User** license is required to create articles.

### [Knowledge Search Basics](https://trailhead.salesforce.com/content/learn/modules/knowledge_search_basics?trailmix_creator_id=strailhead&trailmix_slug=prepare-for-your-salesforce-service-cloud-consultant-credential)

Search Results Order:

- Search term frequency, order and uniqueness
- Record activity
- Access permissions
- Other factors

A phrase first is sought with **AND** and then with **OR**.

Results Expanded with:

- Spell correction
- Lemmatization - identifies and retirns variants of search term
- Synonym groups

**Search Highlights and Snippets**
(In Classic): Setup -> Knowledge Settings -> **Highlight relevant article within search results**

- Search highlights and snippets are generated from email, long text area, rich text area, and text area fields.
- Searches with wildcards don’t generate search highlights and snippets.
- If a snippet is not generated, the article’s summary field is shown instead.

**Auto-complete**
(In Classic): Setup -> Knowledge Settings

- For title searches
- For keyword searches

**Promoted terms**
Requires **Manage Promoted Search Terms** permission. Promoted terms can be managed only for published articles.

**Suggested Articles Based on Case Fields**
Setup -> Knowledge Settings -> check **Suggest related articles om cases** -> select field used to find suggested articles.
By default the search engins always uses the **Description** field to make suggestions.

## Interaction Channels

Exam Weight 10%

### [Social Customer Service Strategies](https://trailhead.salesforce.com/content/learn/modules/social-customer-service-strategies)

x

### [Service Cloud Agent Productivity](https://trailhead.salesforce.com/content/learn/modules/service-cloud-agent-productivity)

Console Productivity Tools:

- Quick text
- Macros - for consistency and performing repetitive tasks
  - Regular macros - perform actions that can be undone, e.g. insert an email template but don't send the email
  - Irreversible macros - contain `Submit Action` instruction. Special permission required for users to work with them.
  - Bulk mascros - can run on multiple records at a time
- History
- Mass quick actions - let edit up to 100 records in a list view, only with following quick action types: Create a Record and Update a Record
- Split view
- Email templates
- Email notifications
- Predefined field values for quicks actions

### [Omni-Channel for Lightning Experience](https://trailhead.salesforce.com/content/learn/modules/omni-channel-lex)

### [Artificial Intelligence for Customer Service](https://trailhead.salesforce.com/content/learn/modules/artificial-intelligence-for-customer-service)

- Increase deflection and reduce handle time. Einstein Bots can resolve routine customer requests and seamlessly hand off the customer to an agent if an issue requires a human touch.
- Turbocharge agent productivity. Einstein Agent gives your agents intelligent, in-context suggestions, helping them do what they do best—help your customers.
- Rapid deployment and time-to-value. Service Cloud Einstein is preintegrated with Salesforce and your existing service channels, and comes with an out-of-the-box, intuitive user interface.

### [Salesforce Mobile App Rollout](https://trailhead.salesforce.com/content/learn/modules/salesforce1_rollout)

### [Salesforce Mobile SDK Basics](https://trailhead.salesforce.com/content/learn/modules/mobile_sdk_introduction)

Salesforce offers 2 most basic and comprehensive options to build and deploy mobile apps:

1. Salesforce app - point and click tools for admins and Lightning web development for advanced admins.
2. Salesforce Mobile SDK - tools for developers to build mobile apps with customized UI, stand=alone custom apps to sistribute via Apple App Store or Google Play Store.

Salesoforce Mobile SDK provides features and services:

- Enterprise Identity and Security - SDK includes implementation of SF Connected App Policy, supports SAML and advanced auth flows
- SmartStore Encrypted Database
- Mobile Sync - API for sync between offline database ans SF cloud
- Mobile Services - push notifications, geolocation, analytics, collaboration tools, business logic in the cloud
- SF Communities - to target partners and customers
- iOS and Android - supprt development in these mobile systems

## Case Management

Exam Weight 15%

### [Service Cloud Basics](https://trailhead.salesforce.com/content/learn/modules/service-cloud-platform-quick-look)

### [Create a Process for Managing Support Cases](https://trailhead.salesforce.com/content/learn/projects/create-a-process-for-managing-support-cases)

Project

### [Set Up Case Escalation and Entitlements](https://trailhead.salesforce.com/content/learn/projects/set-up-case-escalation-entitlements)

Project

## Contact Center Analytics

Exam Weight 5%

### []