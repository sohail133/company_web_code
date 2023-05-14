class AddStatusToPortfolios < ActiveRecord::Migration[5.2]
  def change
    add_column :portfolios, :status, :integer, default: 0
  end
end
