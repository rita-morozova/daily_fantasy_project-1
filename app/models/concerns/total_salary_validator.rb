class TotalSalaryValidator < ActiveModel::Validator

    def validate(record)
        unless record.total_salary <= 6.0
            record.errors[:team] << " was overbudget"
        end
    end
end