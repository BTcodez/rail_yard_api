class ChangeMaterials < ActiveRecord::Migration[7.1]
  def change
    remove_column :raw_materials, :weight, :decimal
  end
end
