class CreatePortfolios < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolios do |t|
      t.string :title
      t.string :client
      t.datetime :project_date
      t.string :project_url
      t.string :description
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
