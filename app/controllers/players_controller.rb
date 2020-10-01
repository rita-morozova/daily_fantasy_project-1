class PlayersController < ApplicationController
    skip_before_action :require_login, only: [:analytics]

    def index
        @players = Player.all
        @players_qb = @players.where(position: "QB")
        @players_rb = @players.where(position: "RB")
        @players_wr = @players.where(position: "WR")
        @players_te = @players.where(position: "TE")
    end 

    def show
        @player = Player.find(params[:id])
    end

    def analytics 
        # @players = Player.all
    end
end
