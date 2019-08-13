class CreatePaymentHistories < ActiveRecord::Migration
  def change
    create_table :payment_histories do |t|
      t.integer :user_id
      t.string :payment_type
      t.string :amount
      t.string :status

      t.timestamps null: false
    end
  end
end
