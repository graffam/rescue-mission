class AnswersController < ApplicationController


  def new
    @answer = Answer.new
  end
  def create
    @question = Question.find_by(:id == answer_params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.user_id = 1
    if @answer.save
      redirect_to question_path(@question)
    else
      render 'questions/show'
    end
  end

  def show
  end

  def edit
  end
private
def answer_params
  params.require(:answer).permit(:answertext,:question_id)
end
end
