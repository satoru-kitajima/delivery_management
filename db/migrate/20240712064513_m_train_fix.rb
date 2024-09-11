class MTrainFix < ActiveRecord::Migration[6.1]
  def change
    rename_table :m_trains, :trains
  end
end
