class GistQuestionService

  class ResultOfConnection

    attr_reader :gist_url

    def initialize(connection)
      @gist_url = connection[:html_url]
    end

    def success?
      @gist_url.present?
    end
  end

  attr_reader :result

  def initialize(question, client: default_client)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  def call
    @result = ResultOfConnection.new(@client.create_gist(gist_params))
    result.success? ? result.gist_url : false
  end

  private

  def gist_params
    {
      "description": I18n.t('services.git_question_service.description', title: @test.title),
      "public": true,
      "files": {
        "test-guru-question.txt": {
            "content": gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

  def default_client
    Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end
end
