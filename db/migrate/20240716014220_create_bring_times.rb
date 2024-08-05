class CreateBringTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :bring_times do |t|
      t.datetime :time
      t.bigint :request_id

      t.timestamps
    end
  end
end
