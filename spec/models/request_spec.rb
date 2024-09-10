require 'rails_helper'

RSpec.describe Request, type: :model do
  it "リクエストが有効であること" do
    request = Request.new(
      delivery_date: Date.today,
      pickup_id: 1,
      dropoff_id: 1,
      trains_id: 1,
      user_id: 1
    )
    expect(request).to be_valid
  end
end
