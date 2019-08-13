class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :user_id
      t.integer :album_id
      t.string :pic_upload

      t.timestamps null: false
    end
  end
end
