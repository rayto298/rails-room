class AddImageToWebApps < ActiveRecord::Migration[7.1]
  def change
    add_column :web_apps, :image, :string
  end
end
