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

    def avg_weekly_score
        week1 = Week.all.select{|week| week.game_week == 1}.map{|item| item.score}.inject{|sum,n| sum + n}
        week2 = Week.all.select{|week| week.game_week == 2}.map{|item| item.score}.inject{|sum,n| sum + n}
        week3 = Week.all.select{|week| week.game_week == 3}.map{|item| item.score}.inject{|sum,n| sum + n}

        total = week1 + week2 + week3 / 3
    end

    def top_five_players_by_position
        top_qb = Player.all.select{|player| player.position == "QB"}.sort_by{|player| player.salary_modifier}.reverse[0..5]
        top_qb.map {|player| player.name + " $ " + ((player.salary_modifier * 10000).round(0)).to_s(:delimited)}
        top_rb = Player.all.select{|player| player.position == "RB"}.sort_by{|player| player.salary_modifier}.reverse[0..5]
        top_rb.map {|player| player.name + " $ " + ((player.salary_modifier * 10000).round(0)).to_s(:delimited)}
        top_wr = Player.all.select{|player| player.position == "WR"}.sort_by{|player| player.salary_modifier}.reverse[0..5]
        top_wr.map {|player| player.name + " $ " + ((player.salary_modifier * 10000).round(0)).to_s(:delimited)}
        top_te = Player.all.select{|player| player.position == "TE"}.sort_by{|player| player.salary_modifier}.reverse[0..5]
        top_te.map {|player| player.name + " $ " + ((player.salary_modifier * 10000).round(0)).to_s(:delimited)}
    end


end
