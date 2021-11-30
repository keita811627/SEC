class Public::RequestsController < ApplicationController
  before_action :authenticate_user!

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.user_id = current_user.id
    if @request.save
    redirect_to public_requests_path
    else
      render :new
    end
  end

  def index
    @requests = current_user.requests
  end

  private

  def request_params
   params.require(:request).permit(:request)
  end

end
