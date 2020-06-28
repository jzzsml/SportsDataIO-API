SportsData.io API Ruby Gem
==================================

A Ruby Gem for the [SportsData.io](https://sportsdata.io/)

REAL-TIME SPORTS DATA FOR GAMING, MEDIA & BEYOND

Setup
=================
First, [sign up](https://sportsdata.io/) for a sportsdata.io account. Then...

Install the gem:

```
gem install sports_data_io
```

And require it:

````ruby
require 'rubygems'
require 'sports_data_io'
````

If you're using Rails, add the gem to your Gemfile and run ```bundle install```

````ruby
gem 'sports_data_io'
````

Before you can access the feeds you must set your API key (found on the [sportsdata.io subscriptions](https://sportsdata.io/members/subscriptions)) by one of two methods:

Set an environment variable via the terminal (good for production environments where you don't want to commit credentials to a repo).

````term
export SPORTS_DATA_IO_API_KEY="QWERTY123456"
````

Set a class variable from your script.

```ruby
SportsDataIO.api_key = "QWERTY123456"
```

Contributors
======================
[Sergei Gridasov](https://github.com/jzzsml)
