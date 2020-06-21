class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :score
      t.date :goal_date

      t.timestamps
    end
  end
end
