class CreateWebApps < ActiveRecord::Migration[7.1]
  def change
    create_table :web_apps do |t|
      t.string :title
      t.text :description
      t.string :url
      t.string :github_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
