class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :skills
      t.string :club_name
      t.string :location
      t.string :time_perid
      t.string :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
