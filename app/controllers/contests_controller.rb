class ContestsController < ApplicationController
    before_action :get_contest, only: [:show, :edit, :update, :destroy]
    skip_before_action :require_login, only: [:index]

    def index
        @contests = Contest.all
    end

    def show

    end

    def new
        @contest = Contest.new
    end

    def create
        @contest = Contest.new(contest_params)
        if @contest.valid?
            @contest.save
            redirect_to contest_path(@contest)
        else
            flash[:errors] = @contest.errors
            redirect_to new_contest_path
        end
    end

    def edit

    end

    def update
        @contest.update(contest_params)
        if @contest.valid?
            redirect_to contest_path(@contest)
        else
            flash[:errors] = @contest.errors
            redirect_to edit_contest_path
        end
    end

    def destroy
        @contest.destroy
        redirect_to contests_path
    end

    private

    def get_contest
        @contest = Contest.find(params[:id])
    end

    def contest_params
        params.require(:contest).permit(:name, :prize, :budget, :game_week)
    end
end
