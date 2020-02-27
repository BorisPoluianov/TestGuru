module LayoutHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repos)
    link_to repos, "https://github.com/#{author}/#{repos}", target: :blank
  end
end
