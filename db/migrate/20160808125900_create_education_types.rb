class CreateEducationTypes < ActiveRecord::Migration
  def change
    create_table :education_types do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
