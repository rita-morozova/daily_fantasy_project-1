class PlayersController < ApplicationController
    def show
        @player = Player.find(params[:id])
        #Player.update_salary_modifiers
    end
end
