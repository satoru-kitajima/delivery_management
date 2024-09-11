class Trains < ActiveRecord::Migration[6.1]
  def change
    rename_column :requests, :train_id, :trains_id
  end
end
