class CreateUserSubscriptions < ActiveRecord::Migration
  def change
    create_table :user_subscriptions do |t|
      t.integer :plan_id
      t.integer :plan_period_id
      t.datetime :renewal_date
      t.datetime :expiry_date
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
