# require 'rails_helper'

# RSpec.describe RequestsController, type: :controller do
#     let(:user) { create(:user) }  # テスト用のユーザーを作成

#   before do
#     session[:user_id] = user.id
#   end

#   describe "POST #create" do
#     it "creates a new request" do
#       post :create, params: {
#         request: {
#             delivery_date: Date.today.to_s,
#             trains_id: 1,
#             pickup_required: true,
#             dropoff_id: 1,
#             pickup_id: 1,
#             package_attributes: {
#               size: 100,
#               quantity: 2,
#               item_id: 1
#             }
#         }
#       }
#         expect(response).to redirect_to("/")
#     end

#     it "does not create a request with invalid data" do
#         post :create, params: { request: { delivery_date: nil } }
#         expect(response).to redirect_to(new_request_path)
#     end
#   end
# end
