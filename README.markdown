# Simple Admin
### A database-less admin authentication based on OpenID

Provides a thin wrapper around the excellent ruby-openid gem from JanRan. Be sure to install that first:

  gem install ruby-openid

## Installation

Install the plugin and add the before filter

    before_filter :ensure_admin

## Helpers

The following helpers are available in your controller and views:
	
	* current_user - returns the current authenticated user
	* authorized? - tells you whether or not the current session is authenticated

