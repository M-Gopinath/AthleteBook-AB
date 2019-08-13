class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :period
      t.string :course_of_study
      t.string :activities
      t.string :descripition
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
