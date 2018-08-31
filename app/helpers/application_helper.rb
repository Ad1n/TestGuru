module ApplicationHelper

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'GitHub', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def admin?
    current_user.is_a?(Admin) && !current_user.nil?
  end
end
