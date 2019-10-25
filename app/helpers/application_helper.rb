# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

  def flash_message(type)
    content_tag :p, flash[type], class: "flash #{type}" if flash[type]
 end
end
