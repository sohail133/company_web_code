class AddStatusToTechnologies < ActiveRecord::Migration[5.2]
  def change
    add_column :technologies, :status, :integer, default: 0
  end
end
