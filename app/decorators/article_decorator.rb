module ArticleDecorator

  def desplay_created_at
    I18n.l(self.created_at,format: :default)
  end

  def author_name
    user.display_name
  end

  def like_count
    likes.count
  end
end