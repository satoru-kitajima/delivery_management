class UpdatePreferredShipmentToTrainsInRequests < ActiveRecord::Migration[6.1]
  def change
    # preferred_shipmentカラムを削除
    remove_column :requests, :preferred_shipment, :bigint
    
    # 外部キー制約を削除
    remove_foreign_key :requests, column: :preferred_shipment_id

    # preferred_shipment_idをtrain_idに変更
    rename_column :requests, :preferred_shipment_id, :train_id

    # 外部キー制約をtrainsテーブルに接続
    add_foreign_key :requests, :trains, column: :train_id
  end
end
