require_relative './spec_helper.rb'
require_relative '../lib/sports_data_io.rb'

describe 'Request to SportsDataIO::Soccer', vcr: true do
  let(:bad_params) { { my_param: 'bad_value' } }
  let(:current_apl_season) { 86 }
  let(:good_season_teams_params) { { season_id: current_apl_season } }

  it 'with competitions service should catch competions' do
    response = SportsDataIO.request_soccer_info('Competitions')
    competition_apl = response[0]
    competition_rfpl = response[13]

    expect(competition_apl['CompetitionId']).to eq 1
    expect(competition_apl['AreaId']).to eq 68
    expect(competition_apl['AreaName']).to eq 'England'
    expect(competition_apl['Name']).to eq 'Premier League'
    expect(competition_rfpl['CompetitionId']).to eq 14
    expect(competition_rfpl['AreaId']).to eq 160
    expect(competition_rfpl['AreaName']).to eq 'Russia'
    expect(competition_rfpl['Name']).to eq 'RFPL'
  end  

  it 'with competitions service should ignore bad_params' do
    expect{ SportsDataIO.request_soccer_info('Competitions', bad_params) }.to_not raise_error(SportsDataIO::InternalError)
  end

  it 'with season_teams service should catch season_teams' do
    response = SportsDataIO.request_soccer_info('SeasonTeams', good_season_teams_params)
    liverpool_hash = response[7]

    expect(response.size).to eq 20
    expect(liverpool_hash['TeamId']).to eq 515
    expect(liverpool_hash['TeamName']).to eq 'Liverpool'
  end

  it 'with season_teams service without params or with bad_params should raise InternalError' do
    expect{ SportsDataIO.request_soccer_info('SeasonTeams') }.to raise_error(SportsDataIO::InternalError)
    expect{ SportsDataIO.request_soccer_info('SeasonTeams', bad_params) }.to raise_error(SportsDataIO::InternalError)
  end

  it 'with wrong_service service should raise InternalError' do
    expect{ SportsDataIO.request_soccer_info('WrongService') }.to raise_error(SportsDataIO::InternalError)
  end
end
