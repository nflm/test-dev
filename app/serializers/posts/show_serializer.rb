class Posts::ShowSerializer < PostSerializer
  attributes :id, :title, :body, :published_at, :author_nickname

  def author_nickname
    @object.user.nickname
  end

  def published_at
    @object.published_at.to_s :db
  end

end
