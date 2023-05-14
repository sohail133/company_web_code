class AddStatusToClientReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :client_reviews, :status, :integer, default: 0
  end
end
