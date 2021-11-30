class Admin::RequestsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @requests = Request.all
  end
end
