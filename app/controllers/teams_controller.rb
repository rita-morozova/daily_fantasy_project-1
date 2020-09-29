class TeamsController < ApplicationController
    def new
        @players = Player.all.sort_by{|player| player.salary_modifier}.reverse
    end
end
