class AddAmountToSubmissions < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :amount, :integer
  end
end
