class TeachingPositionsController < ApplicationController

  include RegistrationHelper

  before_action :set_teaching_position, only: [:show]
  before_action :mark_registration_action

  def new
    @teaching_position = current_teacher.teaching_positions.build
  end

  def create
    @teaching_position = current_teacher.teaching_positions.new(teaching_position_params)

    respond_to do |format|
      if @teaching_position.save
        format.html do
          if amid_registration?
            redirect_to [:edit, current_teacher]
          else
            redirect_to @teaching_position, :notice => 'Teaching position was successfully created.'
          end
        end
        format.json { render :show, status: :created, location: @teaching_position }
      else
        format.html { render :new }
        format.json { render json: @teaching_position.errors, status: :unprocessable_entity }
      end
    end
  end

private

  def set_teaching_position
    @teaching_position = TeachingPosition.find(params[:id])
  end

  def teaching_position_params
    params
      .require(:teaching_position)
      .permit(
        :school_id,
      )
  end

end
