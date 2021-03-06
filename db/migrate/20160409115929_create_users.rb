class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'uuid-ossp'

    create_table :users, id: :uuid do |t|
      t.string :name
      t.string :device_token
      t.string :photo_url

      t.timestamps
    end
  end
end
