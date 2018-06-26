class DeleteBodyFromPullRequests < ActiveRecord::Migration[5.1]
  def change
    remove_column :pull_requests, :body
  end
end
