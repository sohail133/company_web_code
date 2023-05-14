class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.string :location
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
