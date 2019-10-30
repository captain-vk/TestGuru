# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

protected

  def after_sign_in_path_for(user)
    if user.is_a?(Admin)
      admin_tests_path
    else
      tests_path
    end
  end
end
