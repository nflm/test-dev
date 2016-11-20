class Post < ApplicationRecord
  before_validation :set_published_at

  validates :title, :body, presence: true
  validates_datetime :published_at

  belongs_to :user

  private

  def set_published_at
    self.published_at ||= Time.now.to_s :db
    #self.user_id = @current_user.id
  end
end
