class DoctorsController < ApplicationController
  before_action :authenticate_user

  def index
    @doctors = current_user.doctors
    render :index
  end

  def show
    @doctor = Doctor.find_by(id: params[:id])
    render :show
  end

  def create
    @doctor = Doctor.new({

      name: params[:name],
      specialty: params[:specialty],
      visit_id: params[:visit_id],
      note: params[:note],

    })
    if @doctor.valid?
      @doctor.save
      render :show
    else
      render json: { errors: @doctor.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @doctor = Doctor.find_by(id: params[:id])

    @doctor.update(

      name: params[:name] || @doctor.name,
      specialty: params[:specialty] || @doctor.specialty,
      note: params[:note] || @doctor.note,
      visit_id: @doctor.visit_id,
    )
    if @doctor.valid?
      render :show
    else
      render json: { errors: @doctor.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @doctor = Doctor.find_by(id: params[:id])
    @doctor.destroy
    render json: { message: "doctor was removed." }
  end
end
