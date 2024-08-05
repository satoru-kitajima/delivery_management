class ChangeStartTimeInEvents < ActiveRecord::Migration[6.1]
  def up
    change_column :trains, :reception_start_time, :time
    change_column :trains, :extradition_start_time, :time
  end
  def down
    change_column :trains, :reception_start_time, :datetime
    change_column :trains, :extradition_start_time, :datetime
  end
end
