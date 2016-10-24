class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string     :body
      t.belongs_to :user, index: true, foreign_key: true
      t.datetime   :published_at
    end
  end
end
