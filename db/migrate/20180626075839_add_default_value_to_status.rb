class AddDefaultValueToStatus < ActiveRecord::Migration[5.1]
  def change
    change_column_default :pull_requests, :status, 0
  end
end
