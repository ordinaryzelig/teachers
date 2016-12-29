class TeacherRequestsController < ApplicationController
  before_action :set_teacher_from_params, :only => [:index]
  before_action :set_teacher_request, only: [:show, :edit, :update, :destroy, :close]

  # teachers/:teacher_id/teacher_requests
  def index
    @teacher_requests = TeacherRequest.all
  end

  def show
  end

  def new
    @teacher_request = current_teacher.teacher_requests.build
  end

  def edit
  end

  def create
    @teacher_request = current_teaching_position.teacher_requests.build(teacher_request_params)

    respond_to do |format|
      if @teacher_request.save
        @teacher_request.teacher.supporters.each do |supporter|
          TeacherRequestsMailer.created(@teacher_request, supporter).deliver_later
        end
        format.html { redirect_to @teacher_request, notice: 'Teacher request was successfully created.' }
        format.json { render :show, status: :created, location: @teacher_request }
      else
        format.html { render :new }
        format.json { render json: @teacher_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @teacher_request.update(teacher_request_params)
        format.html { redirect_to @teacher_request, notice: 'Teacher request was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher_request }
      else
        format.html { render :edit }
        format.json { render json: @teacher_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def close
    @teacher_request.close!
    redirect_to @teacher_request
  end

  private

    def set_teacher_from_params
      @teacher ||= User.find(params[:teacher_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_teacher_request
      @teacher_request = current_teacher.teacher_requests.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_request_params
      params
        .require(:teacher_request)
        .permit(
          :title,
          :description,
          :closed_at,
        )
    end

  def can_edit_teacher_request?(teacher_request)
    teacher_request.teacher == current_user
  end
  helper_method :can_edit_teacher_request?
end
