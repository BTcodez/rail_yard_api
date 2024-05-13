class ChangeOrders < ActiveRecord::Migration[7.1]
  def change
    change_column_null :orders, :requested_date, true
    change_column_null :orders, :received_date, true
    change_column_null :orders, :extraction_start, true
    change_column_null :orders, :extraction_end, true
    change_column_null :orders, :release_date, true
    add_column :orders, :weight, :decimal
  end
end
