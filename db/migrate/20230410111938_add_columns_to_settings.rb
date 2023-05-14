class AddColumnsToSettings < ActiveRecord::Migration[5.2]
  def change
    add_column :settings, :social_urls, :jsonb
    add_column :settings, :copyright, :string
  end
end
