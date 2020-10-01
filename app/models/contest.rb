class Contest < ApplicationRecord
    has_many :teams
    has_many :users, through: :teams

    validates :name, uniqueness: true
    validates :budget, numericality: { greater_than: 59999 }
    validates :prize, numericality: { greater_than: 0 }
    validates :game_week, inclusion: { in: 1..17 }

    def ranked_users
        self.users.sort_by do |user|
            user.score_for_contest(self)
        end.reverse
    end

    def count_players
        self.players.find{|player| player.position}
    end

    def self.biggest_prize
        Contest.all.sort_by {|contest| contest.prize}.reverse
    end

    def self.new_scores_for_week(week)
        table = CSV.parse(File.read("storage/points_week_#{week}.csv"), headers: true)
        table.each do |row|
            player = Player.find_by(name: row[1])
            if player
                Week.create(player_id: player.id, game_week: week, score: row[4])
            end
        end
    end
end
