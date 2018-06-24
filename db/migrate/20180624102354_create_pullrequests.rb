class CreatePullrequests < ActiveRecord::Migration[5.1]
  def change
    create_table :pull_requests do |t|
      t.string :title, null: false
      t.string :message
      t.text :body, null: false
      t.references :curriculums
      t.timestamps
    end
  end
end
