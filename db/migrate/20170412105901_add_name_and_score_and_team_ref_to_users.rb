class AddNameAndScoreAndTeamRefToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :score, :integer
    add_reference :users, :team, foreign_key: true
  end
end
