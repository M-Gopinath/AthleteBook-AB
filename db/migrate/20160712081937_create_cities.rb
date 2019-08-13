class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :state_id
      t.string	:code
      t.timestamps null: false
    end
  end
end
