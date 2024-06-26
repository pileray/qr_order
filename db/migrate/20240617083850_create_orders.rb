class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :order_unit, null: false, foreign_key: true, index: { unique: true }
      t.integer :total_without_tax
      t.integer :total_with_tax
      t.datetime :paid_at

      t.timestamps
    end
  end
end
