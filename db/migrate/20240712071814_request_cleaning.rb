class RequestCleaning < ActiveRecord::Migration[6.1]
  def change
    remove_column :requests, :package_size
    remove_column :requests, :delivery_type
    remove_column :requests, :quantity
  
  end
end
