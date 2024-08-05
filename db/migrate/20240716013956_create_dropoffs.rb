class CreateDropoffs < ActiveRecord::Migration[6.1]
  def change
    create_table :dropoffs do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.datetime :available_time_start
      t.datetime :available_time_end

      t.timestamps
    end
  end
end
