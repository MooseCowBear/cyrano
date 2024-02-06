class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update, :destroy, :show]
  before_action only: [:edit, :update, :destroy] do
    confirm_ownership(@profile, "Only the owner of a profile can modify it.")
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(with_specialties_array) 
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
    if @profile.update(with_specialties_array)
      redirect_to @profile, notice: "Profile updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @profile.destroy

    redirect_to dashboard_path
  end

  def show
  end

  private

  def profile_params
    params.require(:profile).permit(:username, :display_name, :pronouns, :about, :specialties)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

  # converting the comma separated string into an array
  def with_specialties_array
    profile_params.merge(specialties: profile_params[:specialties].split(/\s*,\s*/))
  end
end
