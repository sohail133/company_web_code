class AddStatusToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :status, :integer, default: 0
  end
end
