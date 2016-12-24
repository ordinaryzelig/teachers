class TeachingPositionsController < ApplicationController
  before_action :set_teaching_position, only: [:show, :destroy]

  # GET /teaching_positions
  # GET /teaching_positions.json
  def index
    @teaching_positions = TeachingPosition.all
  end

  # GET /teaching_positions/1
  # GET /teaching_positions/1.json
  def show
  end

  # GET /teaching_positions/new
  def new
    @teaching_position = current_teacher.teaching_positions.build
  end

  # POST /teaching_positions
  # POST /teaching_positions.json
  def create
    @teaching_position = current_teacher.teaching_positions.new(teaching_position_params)

    respond_to do |format|
      if @teaching_position.save
        format.html { redirect_to @teaching_position, notice: 'Teaching position was successfully created.' }
        format.json { render :show, status: :created, location: @teaching_position }
      else
        format.html { render :new }
        format.json { render json: @teaching_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teaching_positions/1
  # DELETE /teaching_positions/1.json
  def destroy
    @teaching_position.destroy
    respond_to do |format|
      format.html { redirect_to teaching_positions_url, notice: 'Teaching position was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teaching_position
      @teaching_position = TeachingPosition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teaching_position_params
      params
        .require(:teaching_position)
        .permit(
          :school_id,
        )
    end
end
