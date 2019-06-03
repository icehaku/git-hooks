# Githooks

* Ruby version: ruby 2.6.1p33
* Rails version: Rails 5.2.3

## Description & Usage

A study project trying to work with github webhooks.

* Setup github with the webhook URL that you find on the root page(/webhook/github/);
* Set the github webhook secret with our ENV['GIT_HASH'] value(you can change if you want);
* If you want to use a simple API request validation, uncomment the "auth_bussiness" in the application controller. You need to pass the ENV['TOKEN'] value as a URL parameter named also 'token' to validate.

## TestCI

[![Build Status](https://travis-ci.org/icehaku/minibox.svg?branch=master)](https://travis-ci.org/icehaku/minibox)


## Run the Project

```console
https://github.com/icehaku/git-hooks.git
bundle install
rake db:migrate
rake db:create RAILS_ENV=test #test suite
rspec #test suite
```
# Hosted Project on Heroku

https://git-hooks-ice.herokuapp.com/

* You can try the hosted project doing stuff(open, edit, etcs) with issues on this repo.
