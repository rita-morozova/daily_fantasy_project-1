class Week < ApplicationRecord
    belongs_to :player

    validates :player_id, uniqueness: { scope: :game_week }
end
