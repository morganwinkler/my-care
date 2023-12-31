class MedicationsController < ApplicationController
  before_action :authenticate_user

  def index
    @medications = current_user.medications
    render :index
  end

  def show
    @medication = Medication.find_by(id: params[:id])
    render :show
  end

  def create
    @medication = Medication.new({

      name: params[:name],
      reason: params[:reason],
      visit_id: params[:visit_id],
      note: params[:note],

    })
    if @medication.valid?
      @medication.save
      render :show
    else
      render json: { errors: @medication.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @medication = Medication.find_by(id: params[:id])
    @medication.update(

      name: params[:name] || @medication.name,
      reason: params[:reason] || @medication.reason,
      note: params[:note] || @medication.note,
      visit_id: @medication.visit_id,
    )
    if @medication.valid?
      render :show
    else
      render json: { errors: @medication.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @medication = Medication.find_by(id: params[:id])
    @medication.destroy
    render json: { message: "Medication was removed." }
  end
end
