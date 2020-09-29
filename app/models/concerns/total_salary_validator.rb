class TotalSalaryValidator < ActiveModel::Validator

    def validate(record)
        # total_salary = Player.find(record.qb).salary_modifier
        # total_salary += Player.find(record.rb1).salary_modifier
        # total_salary += Player.find(record.rb2).salary_modifier
        # total_salary += Player.find(record.wr1).salary_modifier
        # total_salary += Player.find(record.wr2).salary_modifier
        # total_salary += Player.find(record.te).salary_modifier

        unless record.total_salary <= 6.0
            record.errors[:team] << " was overbudget"
        end
    end
end