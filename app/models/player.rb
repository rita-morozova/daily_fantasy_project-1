class Player < ApplicationRecord
    has_many :weeks
    
    def self.update_salary_modifiers
        table = CSV.parse(File.read("storage/new_data.csv"), headers: true)
        table.each do |row|
            player = Player.find_by(name: row[3])
            if player
                player.update(salary_modifier: row[7].to_f / 6667)
            end
        end
    end

    def name_team_salary
        self.name + ", " + self.nfl_team_code + " $ " + (self.salary_modifier * 10000 ).round(0).to_s(:delimited)
    end

    def get_score_for_game_week(game_week)
        week = self.weeks.find_by(game_week: game_week)
        week ? week.score : 0
    end

    def self.top_ten 
        top = Player.all.sort_by {|player| player.salary_modifier}.reverse[0..9]
        top.map {|player| player.name + " $ " + ((player.salary_modifier * 10000).round(0)).to_s(:delimited)}
    end

    def self.bottom_ten 
        bottom = Player.all.sort_by {|player| player.salary_modifier}[0..9]
        bottom.map {|player| player.name + " $ " + ((player.salary_modifier * 10000).round(0)).to_s(:delimited)}
    end

    def self.highest_score
        score = Player.top_ten_weeks.map {|week| week.player.name + " " + week.score.to_s}
    end

    def self.top_ten_weeks
        week = Week.all.sort_by {|week| week.score}.reverse[0..9]
    end

    def score_by_week
        self.weeks.map {|week| "Week " + week.game_week.to_s + " score: " + week.score.to_s}
    end
    
end
