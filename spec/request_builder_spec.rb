require_relative './spec_helper.rb'
require_relative '../lib/sports_data_io/application_service.rb'
require_relative '../lib/sports_data_io/request_builder.rb'
require_relative '../lib/sports_data_io/request_builder/soccer.rb'
require_relative '../lib/sports_data_io/internal_error.rb'
# require '../lib/sports_data_io/configs/soccer_methods'

describe 'Request to SportsDataIO::Soccer', vcr: true do

  let(:method_hash) { { 'competitions' => { 'method' => 'Competitions', 'scope' => 'scores' } } }
  let(:api_key) { ENV['SPORTS_DATA_IO_API_KEY'] }

  before do
    allow_any_instance_of(SportsDataIO::Soccer).to receive(:load_config).and_return(method_hash)
  end

  it 'with <Competitions> service should catch competions' do
    response = SportsDataIO::Soccer.call(service: 'Competitions', key: api_key)

    competition_apl = response[0]

    expect(competition_apl['CompetitionId']).to eq 1
    expect(competition_apl['AreaId']).to eq 68
    expect(competition_apl['AreaName']).to eq 'England'
    expect(competition_apl['Name']).to eq 'Premier League'

    competition_rfpl = response[13]

    expect(competition_rfpl['CompetitionId']).to eq 14
    expect(competition_rfpl['AreaId']).to eq 160
    expect(competition_rfpl['AreaName']).to eq 'Russia'
    expect(competition_rfpl['Name']).to eq 'RFPL'
  end

  it 'with <WrongService> service should catch competions' do
    expect{SportsDataIO::Soccer.call(service: 'WrongService', key: api_key)}.to raise_error(SportsDataIO::InternalError)
  end

end
