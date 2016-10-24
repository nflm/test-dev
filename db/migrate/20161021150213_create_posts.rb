class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string     :title
      t.string     :body
      t.belongs_to :user, index: true, foreign_key: true
      t.datetime   :published_at
    end
  end
end
