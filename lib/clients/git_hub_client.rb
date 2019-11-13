# frozen_string_literal: true

class GitHubClient
  ROOT_ENDPOINT = 'https://api.github.com'
  ACCESS_TOKEN = '29088c8f751b1486bbe9953b8f7cbf7597bb1150'

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.post('gists', params) do |request|
      request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
      request.headers['Content-type'] = 'application/json'
      request.body = params.to_json
    end
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end
end
