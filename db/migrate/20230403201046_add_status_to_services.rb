class AddStatusToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :status, :integer, default: 0
  end
end
