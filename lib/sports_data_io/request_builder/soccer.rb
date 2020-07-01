class SportsDataIO
  class Soccer < RequestBuilder

    attr_reader :service
    attr_reader :params
    attr_reader :api_key

    def call
      request_service(matched_service, api_key, params)
    end

    def selected_sport
      'soccer/scores'
    end

    def matched_service
      matched_service =
        case service
        when :players_by_team then 'PlayersByTeam'
        when :competitions then 'CompetitionHierarchy'
        when :teams_by_season then 'SeasonTeams'
        when :standing then 'Standings'
        else raise "Method #{method} is not accepted for SportDataIo"
        end

        matched_service
    end
  end
end