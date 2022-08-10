# [Salesforce Experience Cloud Consultant](https://trailhead.salesforce.com/users/strailhead/trailmixes/prepare-for-your-salesforce-experience-cloud-consultant-credenti)

- [Salesforce Experience Cloud Consultant](#salesforce-experience-cloud-consultant)
  - [Experience Cloud Basics](#experience-cloud-basics)
    - [UX Personas for Salesforce](#ux-personas-for-salesforce)
      - [Personas for Sales Cloud](#personas-for-sales-cloud)
      - [Personas for Service Cloud](#personas-for-service-cloud)
      - [Personas for Marketing Cloud](#personas-for-marketing-cloud)
      - [Personas for Experience Cloud](#personas-for-experience-cloud)
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
    - [Personalize Experience Cloud Sites with Audience Targeting](#personalize-experience-cloud-sites-with-audience-targeting)
    - [Salesforce CMS Basics](#salesforce-cms-basics)
      - [CMS Workspaces](#cms-workspaces)
      - [Content](#content)
    - [Connect Your External CMS to Your Experience Builder Site](#connect-your-external-cms-to-your-experience-builder-site)
    - [Build an Experience Cloud Site with Knowledge and Chat](#build-an-experience-cloud-site-with-knowledge-and-chat)
    - [Give Customers Access to Your Knowledge Base Through Help Center](#give-customers-access-to-your-knowledge-base-through-help-center)
      - [Before start](#before-start)
      - [Set up tasks](#set-up-tasks)
      - [Help Center Template Pages](#help-center-template-pages)
  - [Templates and Themes](#templates-and-themes)
    - [Which Experience Cloud Template Should I Use?](#which-experience-cloud-template-should-i-use)
    - [Build a Custom Theme Layout Component for Experience Builder Sites](#build-a-custom-theme-layout-component-for-experience-builder-sites)
    - [Lightning Bolt for Salesforce: Build Once, Then Distribute and Reuse](#lightning-bolt-for-salesforce-build-once-then-distribute-and-reuse)
  - [User Creation and Authentication](#user-creation-and-authentication)
    - [Create Experience Cloud Site Users](#create-experience-cloud-site-users)
    - [Add Members to Your Experience Cloud Site](#add-members-to-your-experience-cloud-site)
      - [Set Custom Site Roles](#set-custom-site-roles)
    - [Delegate Management to External Users](#delegate-management-to-external-users)
      - [Delegated Account Management](#delegated-account-management)
      - [Allow External Users to Manage Other Accounts with Account Switcher](#allow-external-users-to-manage-other-accounts-with-account-switcher)
    - [Securely Share Your Experience Cloud Sites with Guest Users](#securely-share-your-experience-cloud-sites-with-guest-users)
      - [Give Secure Access to Unauthenticated Users with the Guest User Profile](#give-secure-access-to-unauthenticated-users-with-the-guest-user-profile)
      - [SEO Best Practices and Considerations for Guest Users](#seo-best-practices-and-considerations-for-guest-users)
      - [Control Public Access to Your Experience Builder Sites](#control-public-access-to-your-experience-builder-sites)
      - [Object-Specific Security Best Practices for Guest Users](#object-specific-security-best-practices-for-guest-users)
  - [Identity for Mobile-Centric Customers](#identity-for-mobile-centric-customers)
  - [Adoption and Analytics](#adoption-and-analytics)
    - [Reporting for Experience Cloud Sites](#reporting-for-experience-cloud-sites)
      - [AppEchange Packages](#appechange-packages)
      - [Set Up Report Management for External Users](#set-up-report-management-for-external-users)
      - [Google Analytics™ for Salesforce Communities Package](#google-analytics-for-salesforce-communities-package)

## Experience Cloud Basics
Exam Weight 8%

### [UX Personas for Salesforce](https://trailhead.salesforce.com/content/learn/modules/ux-personas-for-salesforce)

[The Five Ws of Personas](https://developer.salesforce.com/files/ux-personas-fivewspersonas.pdf)

**A persona** represents a group of users clustered based on shared behavior, motivations, goals, pain points, or other characteristics. Personas are based on the general tasks users perform in their roles, rather than focusing only on what they do in their Salesforce CRM.

#### Personas for Sales Cloud

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

#### Personas for Service Cloud

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

#### Personas for Marketing Cloud

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

#### Personas for Experience Cloud

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

> As as  [Persona name]  I want to  [Task I want to do]  so that I  [Impact of completing this task].

`“A (primary) persona must be satisfied by the particular UI, and cannot be satisfied by another persona’s UI.” —Alan Cooper`

Key places where personas can add real value to your company:

1. Smarter roadmap decisions: pusrchasing and licensing, custom features
2. Tailoting user enagagement: trainings, events, activities with users
3. Targeted research: selecting right participants to test `specific` features

### [Community Persona Cards](https://developer.salesforce.com/files/community-persona-cards.pdf?_ga=2.232150359.993844698.1659361337-742205375.1652543223)

### [Search Basics for Experience Builder Sites](https://trailhead.salesforce.com/content/learn/modules/comm_search_basics)

Expanding search results

- Lemmatization - helps users find different forms of a word
- Spelling Correction
- Expanded Queries - If a search term gets no results, this feature finds matches where the search term is part of a word
- AND/OR Searching - first run AND search, if not many results, then run OR search

The relevance of search results

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
> Setup -> Synonyms -> click `New` to start a synonym group

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

Site User Visibility Best Practives for Guest Users

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

Object that can have an external sharing model

- Accounts and their associated contracts and assets
- Assets
- Cases
- Contacts
- Individuals
- Opportunities
- Orders
- Custom Objects
- Users

Salesforce creates and maintains the following site-specific groups

- Portal roles
- Portal role and subordinates
- Roles, Internal and Portal Subordinates
- All Customer Portal Users and All Partner Users public groups
- And if you have channel programs and levels set up, you have Channel Programs and Levels Groups

### [Experience Cloud User Licenses](https://help.salesforce.com/s/articleView?id=sf.users_license_types_communities.htm&type=5)

Licenses used for external user

* Customer Community - B2C experiences w. large numbers of external users who need access to Case objects or Knowledge. Can be used w. Personal Accounts.
* Customer Community Plus - B2C experiences w. external users who need access to reports and dashboards, and need standard sharing. Can be used w. Personal Accounts.
* Partner Community - B2B experiences that need access to sales data such as PRM. Cannot be used w. Personal Accounts.
* External Apps - custom digital experiences to engage any external stakeholder, incl. Brand Engagmenent and Customer Loyalty. Limited access to CRM objects. Can be used w. Personal Accounts.
* External Identity - to deliver identity services. User with the external identity license can be upgraded to a community license at any time.
* Channel Account - B2B sites and portals that calculate their usage based on number of partners instead of inidividual users.

Each community license can be either

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

### [Personalize Experience Cloud Sites with Audience Targeting](https://trailhead.salesforce.com/content/learn/projects/communities_personalize_audiences)

Project

### [Salesforce CMS Basics](https://trailhead.salesforce.com/content/learn/modules/salesforce-cms-basics)

Salesforce CMS is available as an app in Lightning Experience. In addition to traditional content types (think blogs, videos, articles), Salesforce CMS allows you to share data you’ve stored in your CRM system and bring your CRM data to life with rich, engaging formats.

CMS Components:

- Digital Experiences App - accessed through the App Launcher, allows to create content, manage its lifecycle, and assign the content to publishing channels (site, community, Heroku site, Marketing Cloud, or Lightning apps)
- Workspaces - content is organized in different workspaces, with each own contributors, language settings, and channels
- Experience Builder - to build sites.

#### CMS Workspaces

- Primary organizing and security principle in Digital Experiences app
- Consists of 1+ publishing channels
- Helps control access to the content

3 Roles can access CMS Workspace from most to least access:

1. Salesforce Admin
2. Content Admin - has access to all content in the CMS Workspace, and can manage contributors and content sharing
3. Content Manager - full access to all content in the CMS Workspace

#### Content

Use `Managed Content Type API` to create custom content types, such as banners, product information, etc.
Connect CRM data to CMS by crrating a list view with fields to expose, adding CRM connection on Content Management.
Organize content with Collections and Topics

### [Connect Your External CMS to Your Experience Builder Site](https://help.salesforce.com/s/articleView?language=en_US&_ga=2.111932295.2093328585.1659960874-1909944366.1653933554&type=5&id=sf.communities_cms_connect.htm)

`CMS Connect` is available in sites that are based on Customer Service, Partner Central, and Lightning Bolt solutions.

Prerequisites of using `CMS Connect`

- Your HTTP server must serve HTML fragments
- URLs in CSS and JavaScript must be absolute
- Site Host must be a trusted host in the Cross-Origin Resource Sharing (CORS) header
- Experience Builder domains must be allowlisted
- External hosts must be allowlisted
- All CMS servers must be accessible via unauthenticated HTTPS (HTTP over SSL)
- All JavaScript and CSS must be from the same source as HTML
- Experience Workspaces must be enabled
- CMS Connect org perm must be left on

### [Build an Experience Cloud Site with Knowledge and Chat](https://trailhead.salesforce.com/content/learn/projects/build-a-community-with-knowledge-and-chat)

Project

### [Give Customers Access to Your Knowledge Base Through Help Center](https://help.salesforce.com/s/articleView?id=sf.networks_help_center_intro.htm&type=5)

A help center is a public-access, self-service site that makes it easy for people to find answers for themselves.
Use the new `Help Center` template to create a help center in minutes. When your help center is in place, use a guided setup to step through help center configuration. The guided setup offers links that take you to relevant locations in the help center’s user interface.

#### Before start

- `Help Center` offers limited support for standard components.
- `Help Center` is a public-only template.
- Only specific object pages are fully supported, but the template lets you create other standard and custom object pages.

#### Set up tasks

- Plan Your Help Center
- Enable Knowledge in Your Org and Enable the Knowledge Org Preference
- Create and Configure Your Help Center
- Add Branding and Customize Your Help Center Theme

#### Help Center Template Pages

The Help Center template offers a public-facing, self-service portal where guest users can search your knowledge base for answers to their questions. It reduces the load on your customer support staff and gives customers the satisfaction of finding their own solutions.

## Templates and Themes

Exam Weight 10%

### [Which Experience Cloud Template Should I Use?](https://help.salesforce.com/s/articleView?id=sf.siteforce_commtemp_intro.htm&type=5)

- Customer Account Portal - A private and secure place for customers to access and update their account information. Improve customer relationships and decrease service costs by letting customers work in the portal. Customers can see and pay invoices, update their account information, and search your knowledge base for answers to their most frequent questions.
- Partner Central - A flexible, responsive template designed for channel sales workflows. Recruit, build, and grow your partner network to drive channel sales and marketing together in a branded online space. Easily configure lead distribution, deal registration, and marketing campaigns. Share training materials and sales collateral in a central space, and use reports to track your pipeline.
- Customer Service - responsive self-service template with multiple prebuilt theme options. The Customer Service template lets users post questions to the community, search for and view articles, collaborate, and contact support agents by creating cases. Supports Knowledge, Chatter Questions, and cases.
- Help Center - A public-access, self-service community that exposes the articles that you make available from your knowledge base. You reduce the load on your customer support team, and your users get the satisfaction of finding their own solutions.
- Build Your Own (Aura) - Provides the basic pages that every Experience Builder site needs: Home, Create Record, Error, Record Detail, Record List, Related Record List, Search, Check Password, Forgot Password, Login, Login Error, and Register.
- Build Your Own (LWR) - Suitable for developers, consulting partners, and ISVs who are familiar with developing custom Lightning web components, and working with Salesforce DX, User Interface API, and Apex.
- Microsites (LWR) - perfect for event pages, landing pages, or other special purpose websites. Ability to route lead information directly to the Leads object.
- Aloha - App Launcher template that lets users quickly find applications and access them using single sign-on authentication, including social logins.
- Salesforce Tabs + Visualforce - Standard Salesforce structure and tabs that you can customize using Visualforce. Requires developer experience and advanced setup skills. Allows full platform access with a flexible configuration and supports most standard objects, custom objects, and the Salesforce mobile app.

### [Build a Custom Theme Layout Component for Experience Builder Sites](https://trailhead.salesforce.com/content/learn/projects/communities_theme_layout)

Project

### [Lightning Bolt for Salesforce: Build Once, Then Distribute and Reuse](https://help.salesforce.com/s/articleView?id=sf.community_builder_export_overview.htm&type=5)

`Lightning Bolt for Salesforce` lets you quickly build and distribute industry-specific Lightning Bolt Solutions to jump-start new org capabilities. A `Lightning Bolt Solution` can combine custom Lightning apps, business process flows, and Experience Builder templates and pages in an easy-to-build and distributable form.

A `Lightning Bolt Solution` combines one or more of the following:

- Customized Experience Builder templates (theme layout, CSS, pages, content layouts, Lightning components)
- Flow categories (groups of flows)
- Custom apps

## User Creation and Authentication

Exam Weight 13%

### [Create Experience Cloud Site Users](https://help.salesforce.com/s/articleView?language=en_US&_ga=2.40087713.2093328585.1659960874-1909944366.1653933554&type=5&id=sf.networks_create_external_users.htm)

|User Permissions Needed|Permission|
|-|-|
|To create/edit Cuatomer Community Plus or Partner Community users|Manage External Users|
|To creare/edit only Customer Community Plus users|Manage Customer Users|
|To log in as community user|(Manage External Users or Manage Customer Users) and Edit on Accounts|

### [Add Members to Your Experience Cloud Site](https://help.salesforce.com/s/articleView?language=en_US&_ga=2.149217078.1494336318.1659882292-742205375.1652543223&type=5&id=sf.networks_customize_members.htm)

Use profiles and permission sets to manage site membership during the setup process. Adding a profile or permission to a site’s membership gives access to the site to users with that profile or assigned the permission set. Permission Set Groups can't be used.

Other options for granting access to your site:

- Enable self-registration so that external users can register on their own
- Enable authentication providers, such as Facebook, so that external users can log into the site without creating an account

#### Set Custom Site Roles

Experience Cloud site members are typically assigned the role of partner, customer, or employee. However, you can create custom roles for users that replace standard ones. You can also choose to display the member’s company name in place of a role.

To create custom roles Experience Cloud sites:

1. Setup -> Digital Experiences -> All Sites -> Workspaces
2. Administration -> Members
3. Site Role -> Custom 
4. Enter new name to use instead of the role name
5. Save

### [Delegate Management to External Users](https://help.salesforce.com/s/articleView?language=en_US&_ga=2.50189478.1494336318.1659882292-742205375.1652543223&type=5&id=sf.networks_del_external_user_manager_intro.htm)

If your partner organizations have many users, you can delegate user administration to external users, who can:

* Create and edit external user records
* Generate new passwords for external users
* Disable Existing excternal users
* Manage permission sets for external users in their account

#### Delegated Account Management

Give external users the power to manage account members and account brand information. Delegated account managers can create and edit a member, reset a member’s password, and activate or deactivate a member. They can also upload brand logos and save company information for co-branded email templates to partner users, marketing campaigns, deal notifications, and websites.

External users who have been granted delegated external user administration rights can access Account Management.

#### Allow External Users to Manage Other Accounts with Account Switcher

And authorize access to manage the other accounts’ users - add `Manage Users` access.
With `Authorized Access`, the managing user of an external managed account can manage permission sets for other users, reset passwords, activate, deactivate, or add members to the target account.

### [Securely Share Your Experience Cloud Sites with Guest Users](https://help.salesforce.com/s/articleView?language=en_US&_ga=2.252624009.1494336318.1659882292-742205375.1652543223&type=5&id=sf.networks_secure_community.htm)

When this policy is fully enforced, any public-facing site must follow these rules.

* Securing access to records by guest users: guest user external OWD always set to private, guests must only have read access, can't be members of public groups or queues, can't access to records vis manual sharing, can only get access to recors via `guest user sharing rules`
* Assigning new records created by geuest to a default owner in your org
* Viewing other members of a publicly available site - guests can't be assigned ti `View All Users` permission; your org can access member visibility on a site-by-site basis

#### Give Secure Access to Unauthenticated Users with the Guest User Profile

Use a guest user profile to control public access to data, content, and objects in your site that don't require authentication. For example, you can create a customer support community where existing and potential customers can view public discussions, known issues, and solutions posted by other members or support without logging in. Salesforce creates a profile, a user record, and sharing mechanisms that are available only to guest users, regardless of whether the site is configured for public access. All guest visitors to a public site share the same guest user record (one per site) and have the same access level.

General Best Practices and Considerations when configuring the guest user profile:

- The guest user profile is specific to the paricular Experience Cloud site
- If a sit is active, guest users can access a subset of its pages, such as login and error pages
- Review object settings, permissions sets, PSGs, PS lisenses assigned to guest users
- Review all system permissions
- etc...

#### SEO Best Practices and Considerations for Guest Users

To configure your site for search engine optimization (SEO), Salesforce uses the guest user profile to identify the public pages and objects available for indexing. A search engine is considered a guest, or unauthenticated, user. For Experience Builder sites, Salesforce automatically generates a sitemap with a list of the publicly accessible content. For sites built with Salesforce Tabs +Visualforce, you are responsible for creating the sitemap and indicating which pages are included.

#### Control Public Access to Your Experience Builder Sites

Best Practices:

* Don’t create object pages for objects that aren’t exposed to external users. If you have object pages that aren’t being used, delete them.
* Use specific object pages when possible. These pages make public URLs more discoverable to your users.
* If you set up object pages for authenticated users, test the pages to ensure that guest users can’t see them.
* Review page access settings for the search page to ensure that you want the search page accessed by guest users.
* To limit access to the search page, consider creating a search page variation with a guest audience.
* Guest users only see results on objects they have access to.
* Actual record access for the guest user isn’t limited to the objects the admin configures in the Global Search Results component. The guest user can have access to other objects based on org sharing configurations.
* Always check the org’s sharing model (including org-wide defaults and sharing rules) to ensure that the guest user doesn’t have access to your org’s sensitive data.

#### Object-Specific Security Best Practices for Guest Users

* To assign or remove Chatter-specific permissions to guest users, check System Permissions in the guest user profile.
* Give only internal and trusted members the ability to create groups. Consider a group creation workflow with an approval process.
* Keep the number of groups to a minimum, and audit your site’s groups on a regular basis.
* Keep groups private whenever possible.
* Consider a process on who can manage groups.
* Make sure that the content in the group detail page meets your site’s content standards.
* Review files that are publicly accessible and associated to groups to make sure that they meet your site’s content standards.
* Set up moderation rules for all content created by users.

## [Identity for Mobile-Centric Customers](https://trailhead.salesforce.com/content/learn/modules/identity-for-mobile-centric-customers)

Notes can be found [here](../salesforce-identity-and-access-management-architect/salesforce-iam-notes.md#identity-for-mobile-centric-customers)

## Adoption and Analytics

Exam Weight 5%

### [Reporting for Experience Cloud Sites](https://help.salesforce.com/s/articleView?id=sf.networks_reporting_intro.htm&type=5)

#### AppEchange Packages

The Salesforce Communities Management packages give community managers an essential starter set of dashboards and reports to keep tabs on activity and engagement directly in Experience Workspaces. You’ll also have the option to give your community managers access to the package contents so you don’t have to share the dashboard and report folders with them later. When you view the dashboards in Experience Workspaces, site-specific data is displayed.

Use **Insight** ~reports~ to view, monitor, and act on your community’s activity. These reports give you a super-focused look at a specific area while helping you with day-to-day community management. Insights can help you prioritize your work and give you instant access to what matters most.
Use **Dashboards** to view your community’s analytics, such as metrics and trends on activity. Dashboards give you mid-term to long-term views on adoption and engagement in your community. They help you monitor return on investment (ROI) and key performance indicators (KPI).

#### Set Up Report Management for External Users

Partner and customer users can create, delete, and edit reports in their own personal folder or, with sufficient permission, in a privately shared folder. You can grant partner and customer users permissions to create and edit reports through their profiles or permission sets. 

#### Google Analytics™ for Salesforce Communities Package

The package contains pre-configured reports that track search activity within an Experience Cloud site. Google Analytics integrates with your self-service Experience Cloud site to track user types, user IDs, pageviews on Salesforce objects, and customer search activity. We’ve also made it possible to turn on Google’s IP Anonymization, if your policies or needs require it.

