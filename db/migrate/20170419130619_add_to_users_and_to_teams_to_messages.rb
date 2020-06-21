class AddToUsersAndToTeamsToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :to_users, :text
    add_column :messages, :to_teams, :text
  end
end
