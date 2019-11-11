# frozen_string_literal: true

class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required!

  private

  def admin_required!
    flash['alert alert-warning'] = 'You are not authorized for view this page.' unless current_user.is_a?(Admin)
    redirect_to root_path
  end
end
