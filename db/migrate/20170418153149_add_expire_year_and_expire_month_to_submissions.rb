class AddExpireYearAndExpireMonthToSubmissions < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :expire_year, :integer
    add_column :submissions, :expire_month, :integer
  end
end
