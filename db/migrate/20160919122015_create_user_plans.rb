class CreateUserPlans < ActiveRecord::Migration
  def change
    create_table :user_plans do |t|
      t.integer :user_id
      t.integer :plan_id
      t.float :amount
      t.string :payment_type
      t.datetime :expiry_date
      t.string :status

      t.timestamps null: false
    end
  end
end
