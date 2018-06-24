class CurriculumsController < ApplicationController
  before_action :set_curriculum, only: %i(show update destroy)

  def index
    @curriculums = Curriculum.all
    render json: @curriculums
  end

  def show
    render json: @curriculum
  end

  def create
    @curriculum = Curriculum.new(curriculum_params)
    if @curriculum.save
      render json: @curriculum, status: :created, location: @curriculum
    else
      render json:  @curriculum.errors, status: :unprocessable_entity
    end
  end

  def update
    if @curriculum.update(user_params)
      render json: @curriculum
    else
      render json:  @curriculum.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @curriculum.destroy
  end

  private

  def set_curriculum
    @curriculum = Curriculum.find(params[:id])
  end

  def curriculum_params
    params.require(:curriculum).permit(:body)
  end
end
