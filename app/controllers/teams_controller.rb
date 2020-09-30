class TeamsController < ApplicationController
    def new
        @contests = Contest.all
        @team = Team.new
        @players_qb = @team.get_players_by_position("QB").sort_by {|player| player.salary_modifier}.reverse
        @players_rb = @team.get_players_by_position("RB").sort_by {|player| player.salary_modifier}.reverse
        @players_wr = @team.get_players_by_position("WR").sort_by {|player| player.salary_modifier}.reverse
        @players_te = @team.get_players_by_position("TE").sort_by {|player| player.salary_modifier}.reverse
    end

    def create
        @team = Team.new(team_params)
        if @team.valid?
            @team.save
            redirect_to contest_path(@team.contest_id)
        else
            flash[:errors] = @team.errors.full_messages
            redirect_to new_team_path
        end
    end

    def show 
        @team = Team.find(params[:id])
    end

    def edit
        @contests = Contest.all
        @team= Team.find(params[:id])
        @players_qb = @team.get_players_by_position("QB").sort_by {|player| player.salary_modifier}.reverse
        @players_rb = @team.get_players_by_position("RB").sort_by {|player| player.salary_modifier}.reverse
        @players_wr = @team.get_players_by_position("WR").sort_by {|player| player.salary_modifier}.reverse
        @players_te = @team.get_players_by_position("TE").sort_by {|player| player.salary_modifier}.reverse
    end

    def update
        @team = Team.find(params[:id])
        if @team.update(team_params)
            redirect_to team_path(@team)
        else
            flash[:errors] = ["Team is over budget"]
            redirect_to edit_team_path
        end
    end

    private

    def team_params
        params.require(:team).permit(:qb, :rb1, :rb2, :wr1, :wr2, :te, :user_id, :contest_id)
    end
end
