class AddOriginalTextToPullRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :pull_requests, :original_text, :string
    remove_index :pull_requests, :curriculums_id
    remove_reference :pull_requests, :curriculums
  end
end
