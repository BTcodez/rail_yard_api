class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :car_id, null: false
      t.datetime :requested_date, null: false
      t.datetime :received_date, null: false
      t.datetime :extraction_start, null: false
      t.datetime :extraction_end, null: false
      t.datetime :release_date, null: false
      t.references :user, null: false, foreign_key: true
      t.references :raw_material, null: false, foreign_key: true

      t.timestamps
    end

    add_index :orders, :car_id
  end
end
