class ChangeCargoIdTypeInTrains < ActiveRecord::Migration[6.1]
  def up
    change_column :trains, :cargo_id, :bigint
  end

  def down
    change_column :trains, :cargo_id, :integer
  end
end
