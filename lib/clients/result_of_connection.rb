class ResultOfConnection

  attr_reader :gist_url

  def initialize(connection)
    @gist_url = connection[:html_url]
  end

  def success?
    @gist_url.present?
  end
end