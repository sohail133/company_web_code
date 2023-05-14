class AddStatusToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :status, :integer, default: 0
  end
end
