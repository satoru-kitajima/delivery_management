class DropTableName < ActiveRecord::Migration[6.1]
  def change
    drop_table :bring_times
    drop_table :cancels
    drop_table :handler_requests
    drop_table :handlers
  end
end
