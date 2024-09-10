class Request < ApplicationRecord
    validates :delivery_date, presence: true
    validates :trains_id, presence: true
    validates :pickup_id, presence: true
    validates :dropoff_id, presence: true
    validates_associated :package

    belongs_to :train, foreign_key: :trains_id, optional: true
    belongs_to :user, foreign_key: :user_id, optional: true
    belongs_to :pickup, foreign_key: :pickup_id, optional: true
    belongs_to :dropoff, foreign_key: :dropoff_id, optional: true

    has_one :cargo, through: :train
    has_one :package, dependent: :destroy
    accepts_nested_attributes_for :package

    enum status: { pending: 0, confirmed: 1, delivered: 2 }


    def exceeds_cargo_capacity?
        # 新規リクエストに紐づくパッケージのサイズと数量を計算
        new_package_volume = self.package.size * 0.01 * self.package.quantity

        # 既存の同日、同cargo_idに紐づくリクエストのパッケージ量を取得
        total_volume = Request.total_package_volume(self.train.cargo_id, self.delivery_date)

        # 新しいリクエストのパッケージ量を加算して、キャパシティを超えているか確認
        total_volume + new_package_volume > self.train.cargo.capacity
    end

    # 同一日、同一cargo_idに紐づくリクエストのパッケージの合計量を返す
    def self.total_package_volume(cargo_id, delivery_date)
        # 同一日、同一cargo_idに紐づくリクエストを抽出
        requests = where(delivery_date: delivery_date).joins(:train).where(trains: { cargo_id: cargo_id })

        # リクエストに紐づくすべてのパッケージの合計サイズを計算して返す
        requests.joins(:package).sum('packages.size * 0.01 * packages.quantity').to_f
    end
end
