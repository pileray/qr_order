class Admin::BaseController < ApplicationController
  before_action :basic_auth
  layout 'admin/layouts/application'

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == 'password'
    end
  end
end
