class AddForeignKeyToRequests < ActiveRecord::Migration[6.1]
  def change
    change_column :requests, :status, :integer, using: 'status::integer'
  end
end
