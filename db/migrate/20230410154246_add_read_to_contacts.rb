class AddReadToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :read, :boolean
  end
end
