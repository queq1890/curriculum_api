class AddForeignKey < ActiveRecord::Migration[5.1]
  def change
    add_reference :pull_requests, :curriculum, foreign_key: true
  end
end
