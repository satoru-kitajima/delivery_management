class TRequest < ActiveRecord::Migration[6.1]
  def change
    rename :t_requests, :requests
  end
end
