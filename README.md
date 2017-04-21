# Styla SEO Enhancements Shopware Module (v4.2.2)

#### Last updated: 21.04.2017
#### Contributors: Sebastian Sachtleben, Christian Korndoerfer, Roberto Solís, Antonio Cosentino

Styla Connect is a module to connect your Shopware 4 Store with [Styla](http://www.styla.com/). For our Shopware 5 plugin check this https://github.com/styladev/shopware5

The first diagram on [this page](https://styladocs.atlassian.net/wiki/spaces/CO/pages/9961481/Technical+Integration) should provide you an overview of what the plugin does and how it exchanges data with Styla. 

## Installation How-to

- Place the *StylaSEO* folder at the following location of your Shopware installaton: engine/Shopware/Plugins/Local/Frontend
- Once the code is in place, access your Shopware administration page. The Styla SEO Enhancements Shopware module can be configured and activated under **Configuration -> Plugin Manager -> Local Extensions**.
- Click on the Pencil (edit) icon to edit the plugin settings:
    - **Styla Magazine ID**: Your Styla username which is provided to you by your Styla account manager.
    - **Styla SEO Server URL** _(default: http://seo.styla.com/)_: Server that provides SEO information for your magazine content. (**IMPORTANT:** Do not modify this unless approved by Styla)
    - **Styla API Server URL** _(default: http://live.styla.com/)_: Server that provided the necessary scripts and styles for your magazine. (**IMPORTANT:** Do not modify this unless approved by Styla)
    - **Styla Base Folder** _(default: magazine)_: Path to your main magazine page. Your magazine will become available at `/[Styla Base Folder]` (e.g. `/magazine`). (**IMPORTANT:** Before changing, make sure to contact you account manager and provide him/her the new magazine path)

If everything is set up correctly the following pages will be accessible:

    - **Main magazine:** http://[yourwebsite.com]/[Styla Base Folder]/
    - **Tag:** http://[yourwebsite.com]/[Styla Base Folder]/tag/[tagname]
    - **Category:** http://[yourwebsite.com]/[Styla Base Folder]/user/[Styla Magazine ID]/category/[category]
    - **Story:** http://[yourwebsite.com]/[Styla Base Folder]/story/[storyname]
    - **Search:** http://[yourwebsite.com]/[Styla Base Folder]/search/[searchterm]

### Please do not create any subpages in your CMS or directories for your magazine. The plugin itself will take care of setting up the /magazine/ (or any other) page on which the magazine will appear and of the routing as well. 

## Update the Plugin
- Place the *StylaSEO* folder at the following location of your Shopware installation: `engine/Shopware/Plugins/Local/Frontend`
- Once the code is in place, access your Shopware administration page. The Styla Magazine Plugin can be configured and activated under **Configuration -> Plugin Manager -> Local Extensions**.
- Click on the Update icon in the "actions" column of the plugin.
- Click **Configuration -> Cache/performance -> clear shop cache**
