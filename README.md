SportsData.io API Ruby Gem
==================================

A Ruby Gem for the [SportsData.io](https://sportsdata.io/)

Real-time sport data grabber

Setup
--------------------------
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
API Resources
--------------------------
Current sports_data_io gem version is supported __soccer data only__. The range of methods for other sports can be expanded by adding _yml_ file with the corresponding params.
Result of API request is typically an array of hashes:

Areas list:
```ruby
area = SportsDataIO.request_soccer_info('Areas').first
area["AreaId"] = 1
area["CountryCode"] = "INT"
area["Name"] = "World"
area["Competitions"] = 
  [
    {
      "CompetitionId":21,
      "AreaName":"World",
      "Name":"FIFA World Cup",
      "Gender":"Male",
      "Type":"International",
      "Format":"International Cup",
      "Key":"FIFA",
      ...
    }
  ]
```

Competitions (Leagues):
```ruby
competition = SportsDataIO.request_soccer_info('Competitions').first
competition["CompetitionId"] = 1
competition["AreaId"] = 68
competition["AreaName"] = "England"
competition["Name"] = "Premier League"
competition["Gender"] = "Male"
competition["Type"] = "Club"
competition["Format"] = "Domestic League"
```

Memberships by Team (Active):
```ruby
EMPOLI_ID = 667
player = SportsDataIO.request_soccer_info('MembershipsByTeam', { team_id: EMPOLI_ID }).first
player["MembershipId"] = 93255
player["TeamId"] = 667
player["PlayerId"] = 90031100
player["PlayerName"] = "Domenico Maietta"
player["TeamName"] = "Empoli"
player["TeamArea"] = "Italy"
player["Active"] = true
player["StartDate"] = "2018-02-01T00:00:00"
player["EndDate"] = null
player["Updated"] = "2020-04-10T22:52:40"
```

Teams list:
```ruby
liverpool_fс =
  SportsDataIO.request_soccer_info('Teams').select { |team| team["Key"] == "LIV" }
liverpool_fс["TeamId"] = 515
liverpool_fс["AreaId"] = 68
liverpool_fс["VenueId"] = 8
liverpool_fс["Key"] = "LIV"
liverpool_fс["Name"] = "Liverpool FC"
liverpool_fс["FullName"] = "Liverpool Football Club"
liverpool_fс["Active"] = true
liverpool_fс["AreaName"] = "England"
liverpool_fс["VenueName"] = "Anfield"
liverpool_fс["Gender"] = "Male"
liverpool_fс["Type"] = "Club"
liverpool_fс["Address"] = "Anfield Road"
liverpool_fс["City"] = "Liverpool"
liverpool_fс["Zip"] = "L4 OTH"
liverpool_fс["Phone"] = "+44 (0844) 4993000"
liverpool_fс["Fax":"+44 (0151)
liverpool_fс["Email"] = "customercontact@liverpoolfc.tv"
liverpool_fс["Founded"] = 1892
liverpool_fс["ClubColor1"] = "Red"
liverpool_fс["ClubColor2"] = "White"
liverpool_fс["ClubColor3"] = null
liverpool_fс["WikipediaLogoUrl"] = "https:\/\/upload.wikimedia.org\/wikipedia\/en\/thumb\/0\/0c\/Liverpool_FC.svg\/370px-Liverpool_FC.svg.png"
```

Player Game Stats by Player:
```ruby
VAN_DIJK_ID = 90026643
stat = SportsDataIO.request_soccer_info('PlayerGameStatsByPlayer', { player_id: VAN_DIJK_ID, date: "2020-07-26" })
stat["StatId"] = 2223389
stat["SeasonType"] = 1
stat["Season"] = 2020
stat["RoundId"] = 383
stat["TeamId"] = 515
stat["Name"] = "Virgil van Dijk"
stat["Team"] = "Liverpool FC",
stat["PositionCategory"] = "D",
stat["Started"] = 1 
stat["Captain"] = false
stat["Opponent"] = "Newcastle United FC"
stat["Day"] = "2020-07-26T00:00:00"
stat["HomeOrAway"] = "AWAY"
stat["IsGameOver"] = true
stat["GlobalGameId"] = 90022593
stat["FantasyPoints"] = 21.4
stat["Score"] = 7.0

```

The full list of methods and parameters is provided at [API Documentation](https://sportsdata.io/developers/api-documentation/soccer#)

Contributors
--------------------------
[Sergei G](https://github.com/jzzsml)
