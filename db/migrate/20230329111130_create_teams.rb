class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :designation
      t.string :twitter_url
      t.string :facebook_url
      t.string :instagram_url
      t.string :linkedin_url

      t.timestamps
    end
  end
end
