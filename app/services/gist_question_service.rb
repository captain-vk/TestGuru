# frozen_string_literal: true

class GistQuestionService
  attr_reader :response
  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @client.create_gist(gist_params)
    @response = @client.create_gist(gist_params)
  end

  def success?
    @client.last_response.data[:html_url]
  end

  private

  def default_client
    Octokit::Client.new(access_token: ENV['GITHUB_GIST_TOKEN'])
  end

  def gist_params
    {
      descriptiion: "A question about #{@test.title} from TestGuru",
      files: {
        'test-guru-question.txt' => {
          content: gist_content
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
