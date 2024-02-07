class WritingSamplesController < ApplicationController
  before_action :set_writing_sample, only: [:edit, :update, :destroy, :show]
  before_action only: [:edit, :update, :destroy] do
    confirm_ownership(@writing_sample, "Only the creator of a writing sample can modify it.")
  end

  def index
    @writing_samples = current_user.writing_samples
  end

  def show
  end

  def new
    @writing_sample = WritingSample.new
  end

  def create
    @writing_sample = WritingSample.new(with_tags_array)
    @writing_sample.user = current_user

    if @writing_sample.save
      redirect_to @writing_sample, notice: "Sample created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @writing_sample.update(with_tags_array)
      redirect_to @writing_sample, notice: "Sample updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @writing_sample.destroy

    redirect_to dashboard_path
  end

  private

  def writing_sample_params
    params.require(:writing_sample).permit(:title, :body, :tags)
  end

  def set_writing_sample
    @writing_sample = WritingSample.find(params[:id])
  end

  # can this and profile specialties be DRYed out?
  def with_tags_array
    writing_sample_params_params.merge(tags: writing_sample_params[:tags].split(/\s*,\s*/))
  end
end
