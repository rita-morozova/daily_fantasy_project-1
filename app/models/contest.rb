class Contest < ApplicationRecord
    has_many :teams
    has_many :users, through: :teams

    validates :name, uniqueness: true
    validates :budget, numericality: { greater_than: 59999 }
    validates :prize, numericality: { greater_than: 0 }
    validates :game_week, inclusion: { in: 1..17 }

    def ranked_users
        self.users
    end
end
