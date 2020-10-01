class PlayersController < ApplicationController

    def index
        @players = Player.all
        @players_qb = @players.where(position: "QB")
        @players_rb = @players.where(position: "QB")
        @players_wr = @players.where(position: "QB")
        @players_te = @players.where(position: "QB")
    end 

    def show
        @player = Player.find(params[:id])
    end

    def analytics 
        # @players = Player.all
    end
end
