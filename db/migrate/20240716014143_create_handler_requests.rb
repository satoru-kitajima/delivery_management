class CreateHandlerRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :handler_requests do |t|
      t.datetime :date
      t.bigint :station_id

      t.timestamps
    end
  end
end
