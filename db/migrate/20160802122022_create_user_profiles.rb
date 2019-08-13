class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.integer :user_id
      t.string :phone
      t.string :sports_name
      t.text :address
      t.string :college
      t.float :exp

      t.timestamps null: false
    end
  end
end
