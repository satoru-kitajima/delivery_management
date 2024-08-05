class CreateCancels < ActiveRecord::Migration[6.1]
  def change
    create_table :cancels do |t|
      t.bigint :request_id

      t.timestamps
    end
  end
end
