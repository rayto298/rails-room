class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :url
      t.datetime :post_datetime

      t.timestamps
    end
  end
end
