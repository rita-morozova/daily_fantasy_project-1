class PlayersController < ApplicationController

    def index
        @player = Player.all 
    end 

    def show
        @player = Player.find(params[:id])
        #Player.update_salary_modifiers
    end

    def analytics 
        # @players = Player.all
    end
end
