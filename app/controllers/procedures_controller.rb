class ProceduresController < ApplicationController
  before_action :authenticate_user

  def index
    @procedures = current_user.procedures
    render :index
  end

  def show
    @procedure = Procedure.find_by(id: params[:id])
    render :show
  end

  def create
    date = Date.parse(params[:date], "%Y/%m/%d")

    @procedure = Procedure.new({

      name: params[:name],
      date: date,
      visit_id: params[:visit_id],
      reason: params[:reason],
      result: params[:result],
      note: params[:note],

    })
    if @procedure.valid?
      @procedure.save
      render :show
    else
      render json: { errors: @procedure.errors.full_messages }, status: :unprocessable_entity
    end
  end

  #only want user to  be able to update answer/note
  def procedure_params
    params.permit(:result, :note)
  end

  def update
    @procedure = Procedure.find_by(id: params[:id])
    @procedure.update(procedure_params)
    if @procedure.valid?
      render :show
    else
      render json: { errors: @procedure.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @procedure = Procedure.find_by(id: params[:id])
    @procedure.destroy
    render json: { message: "Procedure was removed." }
  end
end
