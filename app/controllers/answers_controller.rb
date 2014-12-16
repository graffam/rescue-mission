class AnswersController < ApplicationController

  def index

  end

  def new
    @answer = Answer.new
    binding.pry
  end
  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to
    end
  end

  def show
  end


private
def answer_params
  params.require(:answer,:question_id).permit(:answertext,:quesiton_id)
end
end
