class WritersController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @writers = User.writer.working
    pp @writers
  end

  def show
    @writer = User.writer.working.find(params[:id])
    # how handle active record not found? 404 or 500?
  end
end
