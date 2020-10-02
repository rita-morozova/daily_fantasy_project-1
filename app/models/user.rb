class User < ApplicationRecord
    has_many :teams
    has_many :contests, through: :teams
    validates :email, uniqueness: true
    validates :username, uniqueness: true
    has_secure_password

    def overall_position
        users_by_balance = User.all.sort_by {|user| user.balance}.reverse
        users_by_balance.find_index {|user| user.id == self.id } + 1
    end

    def score_for_contest(contest)
        team = self.teams.find_by(contest_id: contest.id)
        if team
            return team.get_score
        end
    end

    def self.rank_users
        self.all.sort_by {|user| user.balance }.reverse
    end
end
