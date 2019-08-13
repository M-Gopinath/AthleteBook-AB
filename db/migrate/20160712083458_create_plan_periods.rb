class CreatePlanPeriods < ActiveRecord::Migration
  def change
    create_table :plan_periods do |t|
      t.integer :plan_id
      t.integer :month
      t.float :cost
      t.text :description

      t.timestamps null: false
    end
  end
end
