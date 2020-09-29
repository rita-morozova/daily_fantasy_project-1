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
        self.name + ", " + self.nfl_team_code + " $ " + (self.salary_modifier * 6667 ).round(0).to_s(:delimited)
    end
end
