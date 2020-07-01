Gem::Specification.new do |s|
  s.name = 'sports_data_io_api'
  s.version = '0.1.2'
  s.authors = ['Sergei Gridasov']
  s.date = %q{2020-06-24}
  s.description = 'SportsDataIO API wrapper'
  s.summary = 'A ruby gem for the SportsDataIO API'
  s.email = 'jsserg24@gmail.com'
  s.files = ['README.md',
  'lib/sports_data_io.rb',
  'lib/sports_data_io/request_builder.rb',
  'lib/sports_data_io/request_builder/soccer.rb',
  'lib/sports_data_io/configs/soccer_methods.yml']
  s.homepage = 'https://sportsdata.io'
  s.has_rdoc = false
  s.rubyforge_project = 'sports_data_io'
end