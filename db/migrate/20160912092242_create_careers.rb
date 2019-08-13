class CreateCareers < ActiveRecord::Migration
  def change
    create_table :careers do |t|
      t.string :year
      t.string :description
      t.string :carrer_name
      t.string :career_file
      t.string :user_id

      t.timestamps null: false
    end
  end
end
