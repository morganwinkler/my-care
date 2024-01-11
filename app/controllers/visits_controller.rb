class VisitsController < ApplicationController
  before_action :authenticate_user

  def index
    @visits = current_user.visits
    render :index
  end

  def show
    @visit = Visit.find_by(id: params[:id])
    render :show
  end

  def create
    start_date = Date.parse(params[:start_date], "%Y/%m/%d")
    end_date = params[:end_date].present? ? Date.parse(params[:end_date], "%Y-%m-%d") : nil

    @visit = Visit.new({
      start_date: start_date,
      end_date: end_date,
      hospital: params[:hospital],
      reason: params[:reason],
      user_id: current_user.id,
    })
    if @visit.valid?
      @visit.save
      render :show
    else
      render json: { errors: @visit.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @visit = Visit.find_by(id: params[:id])
    if params[:start_date]
      start = Date.parse(params[:start_date], "%Y/%m/%d")
    end
    if params[:end_date]
      end_date = Date.parse(params[:end_date], "%Y/%m/%d")
    end

    @visit.update(
      start_date: start || @visit.start_date,
      end_date: end_date || @visit.end_date,
      hospital: params[:hospital] || @visit.hospital,
      reason: params[:reason] || @visit.reason,
      user_id: @visit.user_id,
    )
    if @visit.valid?
      render :show
    else
      render json: { errors: @visit.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @visit = Visit.find_by(id: params[:id])
    @visit.destroy
    render json: { message: "Visit was removed." }
  end
end
