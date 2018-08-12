module ApplicationHelper
  require 'date'

  def current_year
    Time.now.strftime("%Y")
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end
end
