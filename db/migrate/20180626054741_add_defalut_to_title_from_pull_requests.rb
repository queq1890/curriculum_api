class AddDefalutToTitleFromPullRequests < ActiveRecord::Migration[5.1]
  def change
    change_column_default :pull_requests, :title, "no title"
  end
end
