# frozen_string_literal: true

module SessionsHelper
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
