class AddPhotoUrlsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :photo_urls, :text, array: true, defualt: []
  end
end
