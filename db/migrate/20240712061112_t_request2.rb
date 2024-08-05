class TRequest2 < ActiveRecord::Migration[6.1]
  def change
    rename_table :t_requests, :requests
  end
end
