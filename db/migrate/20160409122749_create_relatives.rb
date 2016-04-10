class CreateRelatives < ActiveRecord::Migration[5.0]
  def change
    create_table :relatives do |t|
      t.uuid :elder_id, index: true, foreign_key: true
      t.uuid :child_id, index: true, foreign_key: true
      t.string :relation

      t.timestamps
    end
  end
end
