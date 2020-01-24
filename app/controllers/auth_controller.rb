class AuthController < ApplicationController
  before_action :authorize_admin, only: [:secret]

  def secret
  end

end
