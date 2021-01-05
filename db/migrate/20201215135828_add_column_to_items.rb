class AddColumnToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :status_id, :integer, null: false
    add_column :items, :shipping_charge_id, :integer, null: false
    add_column :items, :shipping_area_id, :integer, null: false
    add_column :items, :estimated_shipping_date_id, :integer, null: false
  end
end
