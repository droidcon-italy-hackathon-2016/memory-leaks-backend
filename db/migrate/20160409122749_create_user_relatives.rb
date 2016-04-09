class CreateUserRelatives < ActiveRecord::Migration[5.0]
  def change
    create_table :user_relatives do |t|
      t.uuid :user_id, index: true, foreign_key: true
      t.uuid :relative_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
