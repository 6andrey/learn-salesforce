# [Salesforce Experience Cloud Consultant](https://trailhead.salesforce.com/users/strailhead/trailmixes/prepare-for-your-salesforce-experience-cloud-consultant-credenti)

- [Salesforce Experience Cloud Consultant](#salesforce-experience-cloud-consultant)
  - [Experience Cloud Basics](#experience-cloud-basics)
    - [UX Personas for Salesforce](#ux-personas-for-salesforce)
    - [Community Persona Cards](#community-persona-cards)
    - [Search Basics for Experience Builder Sites](#search-basics-for-experience-builder-sites)
  - [Sharing, Visibility, and Licensing](#sharing-visibility-and-licensing)
    - [Control Which Users Experience Cloud Site Users Can See](#control-which-users-experience-cloud-site-users-can-see)
    - [Set Up Salesforce Knowledge](#set-up-salesforce-knowledge)
    - [Share CRM Data with Your Partners](#share-crm-data-with-your-partners)
    - [Experience Cloud User Licenses](#experience-cloud-user-licenses)
    - [Configure an External Account Hierarchy](#configure-an-external-account-hierarchy)
    - [Data Security](#data-security)
  - [Branding, Personalization, and Content](#branding-personalization-and-content)

## Experience Cloud Basics
Exam Weight 8%

### [UX Personas for Salesforce](https://trailhead.salesforce.com/content/learn/modules/ux-personas-for-salesforce)

[The Five Ws of Personas](https://developer.salesforce.com/files/ux-personas-fivewspersonas.pdf)

**A persona** represents a group of users clustered based on shared behavior, motivations, goals, pain points, or other characteristics. Personas are based on the general tasks users perform in their roles, rather than focusing only on what they do in their Salesforce CRM.

Personas for Sales Cloud:
- Sales Leader - managing, coaching, and training sales reps, managing tools and processes for sales reps.
  - viewing and creating reports and dashboards
  - customizing and adninistering SF
  - communicating with colleagues
- Deal Closer - prepping for saless calls, demoing solutions, preparing quotes, contracts
  - logging activities
  - updating existing prospects and customers
  - entering new prospects and customers 
  - workong with leads and opportiunities
- Data Expert - reporting and sales forecasting, managing sales pipeline and tools for sales team
  - viewing and creating reports and dashboards
  - customizing and adninistering SF
- Pipeline Builder - finding new leads, answering inbound leads, qualifying leads
  - entering new and updating existing prospects and customers
  - logging activities
- Trusted Advisor - maintaining relationships with existing customers
  - entering new and updating existing prospects and customers
  - logging activities

Personas for Service Cloud:
- Case Solver - directly supporting customers, handling escalatged cases
  - Logging activities
  - Troubleshooting issues
  - Updating existing customers
  - viewing and collaborating on cases
- Expert Agent - solving escalated cases, contributing to knowledge base, training agents
  - Logging activities
  - Troubleshooting issues
  - viewing and collaborating on cases
  - creating support cases
- Team Leader - supervising, managing, and training agents
  - viewing status on specific cases
  - viewing and creating reports and dashboards
  - troubleshooting, collaborating on cases
  - reassigning cases
- Service Admin - managing and maintaning Service Cloud instance 
  - customizing and administdring SF
  - viewing and creating reports and dashboards
  - creating users and accounts
  - viewing status on specific cases
  - troubleshooting customer issues

Personas for Marketing Cloud
- Marketing Manager - overseeing teams, projects, and campaigns, crafting and supervising execution of strategy
  - coordinating cross-channel messaging, cadencde, customer journeys
  - approving content
  - analyzing campaign metrics
- Strategic Leader - using data for crafting marketing strategy
  - Reviewing dashboards 
  - approving content for major campaigns
- Marketing Specialist - executing campaigns and using data to find insights
  - developing, scheduling and sending marketing communications
  - analysing data
  - monitoring campaigns
- Designer-Developer - creating and coding marketing assets
  - coding and testing emails
  - coordinating approvals accross marketing assets
- IT Services - supporting marketing data operations
  - managing infrastructure for the org
  - creating APIs for data for Marketing Cloud
  - debugging automations

Personas for Experience Cloud
- Site User - customers, partners and employees who visit site for public information
  - browsing and reading feeds
  - interacting with content
  - collaborating
- Community Manager - protecting, nurturing, and strategizing for Experience Cloud sites
  - moderating forums
  - running reports on health
  - communicating with members
- Site Admin - managing members access and permissions, configurong platform settings
  - controlling and defining site map
  - defining permissions and access
  - controlling information architecture
- Site Builder - customizing appearance and developing new functionality
  - Building components and templates
  - customizing page layouts
  - modifying community appearance

You can also use personas to help you articulate who you're not designing for. In some cases, a feature isn’t used by all of your users, and it is helpful to explicitly acknowledge that this group of users doesn’t need to be considered in the design process.

It’s totally OK if at your organization one user maps to multiple personas!

A user story describes a specific task or activity using one of your personas. A user story is told from the persona’s perspective. It includes the persona, one of their top activities, and their motivations and goals to provide more context and make the story come to life.

>  As as  [Persona name]  I want to  [Task I want to do]  so that I  [Impact of completing this task].

`“A (primary) persona must be satisfied by the particular UI, and cannot be satisfied by another persona’s UI.” —Alan Cooper`

Key places where personas can add real value to your company:
1. Smarter roadmap decisions: pusrchasing and licensing, custom features
2. Tailoting user enagagement: trainings, events, activities with users
3. Targeted research: selecting right participants to test `specific` features

### [Community Persona Cards](https://developer.salesforce.com/files/community-persona-cards.pdf?_ga=2.232150359.993844698.1659361337-742205375.1652543223)

### [Search Basics for Experience Builder Sites](https://trailhead.salesforce.com/content/learn/modules/comm_search_basics)

Expanding search results:
- Lemmatization - helps users find different forms of a word
- Spelling Correction
- Expanded Queries - If a search term gets no results, this feature finds matches where the search term is part of a word
- AND/OR Searching - first run AND search, if not many results, then run OR search

The relevance of search results:
* How many times the search term appears in the record (The more often, the better.)
* Which fields the search term appears in. (Name, title, and subject fields are important.)
* Whether the customer owns the record. (We assume customers want to see the ones they own first.)
* How often the customer views or edits the record. (Again, the more often, the better.)

Global Search Results component can:
- make almost any object searchable in the site. External sources can be added.
- search filtering, to refine the results
- add `All Results` tab to see the best matches

Global Search for Peer-to-Peer Communities component - set up **autocomplete** feature.

Set up **Synonyms Groups**:
- Setup -> Synonyms -> click `New` to start a synonym group

Add search results from external sources - details [here](https://help.salesforce.com/articleView?id=search_federated_parent.htm&language=en_US&_ga=2.128479556.993844698.1659361337-742205375.1652543223)

Community Management Package - install from AppExchange
- view search activity on Community Search Dashboard
  * most searchable terms
  * terms not getting any results
  * type of memmbers searching for the term

[Configure Features with Guided Setup](https://help.salesforce.com/s/articleView?id=sf.networks_guided_setup_intro.htm&type=5&_ga=2.236525897.993844698.1659361337-742205375.1652543223)

As long as you have a Partner license, you can access Guided Setup from Experience Workspaces. 

## Sharing, Visibility, and Licensing
Exam Weight 17%

### [Control Which Users Experience Cloud Site Users Can See](https://help.salesforce.com/s/articleView?id=sf.networks_user_sharing.htm&type=5&_ga=2.250058630.1494336318.1659882292-742205375.1652543223)

User sharing lets you decide whether all users in an Experience Cloud site are visible to each other.
Settings to consider when setting up sharing for external users:
1. Portal User Visibility - if enbled, portal users in the same customer or partner portal account can see each other, regardless OWD, and see SF users that owns the portal account
2. Site User Visibility - if enabled, `See other members of this community` can set ON or OFF, on community-by-community basis
3. Guest User Visibility - `Let guest users see other members of this site` - grant guest user visibility on a site-by-site basis

Change org settings:
> Setup -> Sharing Settings -> Edit -> `Enable Portal User Visibility` or `Site User Visibility` -> Save

Manage user and guest user visibility on a sity-by-site basis:
> Setup -> Digital Experiences -> Click `Workspaces` on a site -> Click `Administration` -> `Prefernces` -> Select `See other members of this site` or `Let guest users see other members of this site` -> Click Save

Site User Visibility Best Practives for Guest Users:
* Hide `Knowledgeable Users` and `Reputation Leaderboard` components to protect identity of most active users
* Never use `View All Users` permission for guest users
* Never use the `Site User Visibility` in Sharing Settings
* Enable `See other memebers on this site` on a site-by site basis to give users visibility to site users
* Don't use the `Site User Visibvility`, if a community must remain private. Instead use sharing rules or sharing sets on the user record to open up user visviljry where needed 
* Consider using nicknames to protect identity of a site's members
* Restrict exposed fields on a user profile layout to a minimum

### [Set Up Salesforce Knowledge](https://trailhead.salesforce.com/content/learn/projects/set-up-salesforce-knowledge)

Project

### [Share CRM Data with Your Partners](https://trailhead.salesforce.com/content/learn/projects/communities_share_crm_data)

Project

Object that can have an external sharing model:
- Accounts and their associated contracts and assets
- Assets
- Cases
- Contacts
- Individuals
- Opportunities
- Orders
- Custom Objects
- Users

Salesforce creates and maintains the following site-specific groups:
- Portal roles
- Portal role and subordinates
- Roles, Internal and Portal Subordinates
- All Customer Portal Users and All Partner Users public groups
- And if you have channel programs and levels set up, you have Channel Programs and Levels Groups

### [Experience Cloud User Licenses](https://help.salesforce.com/s/articleView?id=sf.users_license_types_communities.htm&type=5)

Lecenses used for external user:
* Customer Community - B2C experiences w. large numbers of external users who need access to Case objects or Knowledge. Can be used w. Personal Accounts.
* Customer Community Plus - B2C experiences w. external users who need access to reports and dashboards, and need standard sharing. Can be used w. Personal Accounts.
* Partner Community - B2B experiences that need access to sales data such as PRM. Cannot be used w. Personal Accounts.
* External Apps - custom digital experiences to engage any external stakeholder, incl. Brand Engagmenent and Customer Loyalty. Limited access to CRM objects. Can be used w. Personal Accounts.
* External Identity - to deliver identity services. User with the external identity license can be upgraded to a community license at any time.
* Channel Account - B2B sites and portals that calculate their usage based on number of partners instead of inidividual users.

Each community license can be either:
- member-based
- login-based - purhase a number of logins to be used every month. Logging in multiple times a day for a user counts as one login. Swithcing between sites doesn't comsume extra logins. The timeout period for a session is configurable up to max = 24 hrs.

Users with the `Create and Set Up Experiences` permission automatically have full admin access to `Experience Builder`

Unauthenticated or guest users who access your Experience Cloud site do not use up any of your external licenses. 
Page views are limited for guest users:
Enterprise edition - 500,000/month
Unlimitied edition - 1,000,000/month

### [Configure an External Account Hierarchy](https://help.salesforce.com/s/articleView?language=en_US&_ga=2.220583832.1494336318.1659882292-742205375.1652543223&type=5&id=sf.networks_external_account_hierarchies.htm)

External account hierarchies work like Salesforce role hierarchies. Account records, owned by users with roles in child accounts that are part of an external account hierarchy, share data with the parent accounts in that hierarchy. As a result, data can be shared without creating sharing rules.

1. [Enable external account hierarchies in your org](https://help.salesforce.com/s/articleView?id=exp_cloud_setup_ext_acc_hierarchy_settings.htm&type=5&language=en_US)
   > Setup -> Digital Experiences -> Settings -> Select `Enable External Account Hierarchy` -> Save
2. Click `New` to create a hierarchy
3. To create a level within your hierarchy, click `Add Child Account`, then check `Activate`.
4. Hierachy can up to 5 levels deep

### [Data Security](https://trailhead.salesforce.com/content/learn/modules/data_security)

## Branding, Personalization, and Content

Exam Weight 15%

