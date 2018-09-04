require 'octokit'
require 'dotenv'

class GistQuestionService

  Dotenv.load('services.env')

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    # @client = client || GitHubClient.new
    # @client = client || Octokit::Client.new(access_token: "f9985058f0a0d805035ca795f890103b7f8629c4")
    @client = client || Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  def call
    @client.create_gist(gist_params)
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
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

end
