class Player < ApplicationRecord
    def self.update_salary_modifiers
        table = CSV.parse(File.read("storage/new_data.csv"), headers: true)
        table.each do |row|
            player = Player.find_by(name: row[3])
            if player
                player.update(salary_modifier: row[7].to_f / 6667)
            end
        end
    end
end
