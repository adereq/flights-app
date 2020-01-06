class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.decimal :amount
      t.string :type
      t.string :title

      t.timestamps
    end
  end
end
