class NursesController < ApplicationController
  before_action :authenticate_user

  def index
    @nurses = current_user.nurses
    render :index
  end

  def show
    @nurse = Nurse.find_by(id: params[:id])
    render :show
  end

  def create
    date = Date.parse(params[:date], "%Y/%m/%d")

    @nurse = Nurse.new({

      name: params[:name],
      date: date,
      time: params[:time],
      visit_id: params[:visit_id],
      note: params[:note],

    })
    if @nurse.valid?
      @nurse.save
      render :show
    else
      render json: { errors: @nurse.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @nurse = Nurse.find_by(id: params[:id])
    if params[:date]
      date = Date.parse(params[:date], "%Y/%m/%d")
    end
    @nurse.update(

      name: params[:name] || @nurse.name,
      time: params[:time] || @nurse.time,
      date: date || @nurse.date,
      note: params[:note] || @nurse.note,
      visit_id: @nurse.visit_id,
    )
    if @nurse.valid?
      render :show
    else
      render json: { errors: @nurse.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @nurse = Nurse.find_by(id: params[:id])
    @nurse.destroy
    render json: { message: "Nurse was removed." }
  end
end
