class AddStatusToPullRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :pull_requests, :status, :integer
  end
end
