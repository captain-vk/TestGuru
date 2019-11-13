# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

  def flash_message(type)
    content_tag :p, flash[type], class: "flash #{bootstrap_flash(type)}" if flash[type]
  end

  def bootstrap_flash(flash_type)
    {success: 'alert-success', error: 'alert-error', alert: 'alert-block', notice: 'alert-info'}[flash_type]
  end  
end
