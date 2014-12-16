class QuestionsController < ApplicationController

  def index
    @questions = Question.order(created_at: :desc).all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to "/questions"
    else
      render 'new'
    end
  end

  def show
    @answer = Answer.new
    @question = Question.find_by(id:params[:id])
    @answers = Answer.where(question_id: params[:id])
  end


private
  def question_params
    params.require(:question).permit(:title,:description)
  end
end
