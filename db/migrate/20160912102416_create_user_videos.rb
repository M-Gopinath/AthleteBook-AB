class CreateUserVideos < ActiveRecord::Migration
  def change
    create_table :user_videos do |t|
      t.integer :user_id
      t.string :user_video

      t.timestamps null: false
    end
  end
end
