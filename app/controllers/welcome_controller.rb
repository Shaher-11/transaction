class WelcomeController < ApplicationController
  before_action :require_user

  def index; end
end
