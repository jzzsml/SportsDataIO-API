require_relative './spec_helper.rb'
require_relative '../lib/sports_data_io.rb'

describe 'API KEY setter' do

  before :all do
    @defaul_api_key = ENV['SPORTS_DATA_IO_API_KEY']
    ENV['SPORTS_DATA_IO_API_KEY'] = 'qwerty'
  end

  it 'should set the API key from the ENV variable' do
    expect(SportsDataIO.api_key).to eq 'qwerty'
  end

  it 'should set the API key from the setter' do
    SportsDataIO.api_key = '123456'
    expect(SportsDataIO.api_key).to eq '123456'
  end

  after :all do
    ENV['SPORTS_DATA_IO_API_KEY'] = @defaul_api_key
  end
end