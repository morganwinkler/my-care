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

  def update
    @procedure = Procedure.find_by(id: params[:id])
    if params[:date]
      date = Date.parse(params[:date], "%Y/%m/%d")
    end
    @procedure.update(

      name: params[:name] || @procedure.name,
      reason: params[:reason] || @procedure.reason,
      result: params[:result] || @procedure.result,
      date: date || @procedure.date,
      note: params[:note] || @procedure.note,
      visit_id: @procedure.visit_id,
    )
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
