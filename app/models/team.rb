class Team < ApplicationRecord
  belongs_to :user
  belongs_to :contest

  include ActiveModel::Validations
  validates_with TotalSalaryValidator

  def get_players_by_position(position)
    Player.where(position: position)
  end

  def total_salary
       salary = Player.find(self.qb).salary_modifier
       salary += Player.find(self.rb1).salary_modifier
       salary += Player.find(self.rb2).salary_modifier
       salary += Player.find(self.wr1).salary_modifier
       salary += Player.find(self.wr2).salary_modifier
       salary += Player.find(self.te).salary_modifier
  end

end
