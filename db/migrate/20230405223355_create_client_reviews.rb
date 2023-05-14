class CreateClientReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :client_reviews do |t|
      t.string :name
      t.string :designation
      t.string :review

      t.timestamps
    end
  end
end
