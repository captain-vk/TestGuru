# frozen_string_literal: true

class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required!

  private

  def admin_required!
    unless current_user.is_a?(Admin)
      redirect_to root_path, notice: 'You are not authorized for view this page.'
    end
  end
end
