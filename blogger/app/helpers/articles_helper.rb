module ArticlesHelper
  def new_article_if_logged_in
    if logged_in?
      link_to("New Article", new_article_path)
    else
      link_to("Login To Create a New Article!", login_path)
    end
  end
end