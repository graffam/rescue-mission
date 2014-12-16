class QuestionsController < ApplicationController

  def index
    @questions = Question.order(created_at: :desc).all
  end

  def update
    @answer = Answer.new
    @question = Question.find_by(:id == params[:id])
    if @question.update(question_params)
      redirect_to question_path
    else
      render question_path
    end
  end

  def edit
    @question = Question.find_by(:id == params[:id])
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
  def destroy
    @question = Question.find_by(:id == params[:id])
    if @question.destroy
      redirect_to "/questions"
    else
      render 'question'
    end
  end

  def show
    @answer = Answer.new
    @question = Question.find_by(id:params[:id])
    @answers = Answer.order(created_at: :desc).where(:question_id == params[:id])
  end


private
  def question_params
    params.require(:question).permit(:title,:description,:id)
  end
end
