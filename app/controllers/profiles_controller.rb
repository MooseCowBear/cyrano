class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update, :destroy]
  before_action only: [:edit, :update, :destroy] do
    confirm_ownership(@profile, "Only the owner of a profile can modify it.")
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    if @profile.save
      redirect_to @profile, notice: "Profile created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile, notice: "Profile updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @profile.destroy

    redirect_to dashboard_path
  end

  private

  def profile_params
    params.require(:profile).permit(:username, :display_name, :about)
  end

  def set_profile
    @profile
  end
end
