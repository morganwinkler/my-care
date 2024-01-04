class QuestionsController < ApplicationController
  before_action :authenticate_user

  def index
    @questions = current_user.questions
    render :index
  end

  def show
    @question = Question.find_by(id: params[:id])
    render :show
  end

  def create
    @question = Question.new({

      question: params[:question],
      answer: params[:answer],
      note: params[:note],
      active: params[:active],
      visit_id: params[:visit_id],

    })
    if @question.valid?
      @question.save
      render :show
    else
      render json: { errors: @question.errors.full_messages }, status: :unprocessable_entity
    end
  end

  #only want user to  be able to update answer/note
  def question_params
    params.permit(:answer, :note)
  end

  def update
    @question = Question.find_by(id: params[:id])
    @question.update(question_params)
    if @question.valid?
      render :show
    else
      render json: { errors: @question.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @question = Question.find_by(id: params[:id])
    @question.destroy
    render json: { message: "Question was removed." }
  end
end
