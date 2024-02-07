class DashboardController < ApplicationController
  def show
    @active_tab = params[:active_tab]
  end
end
