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
end
