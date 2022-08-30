class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
    if @question.save!
      flash[:notice] = "Your question has successfully been submitted"
      redirect_to question_path(@question)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def question_params
    params.require(:question).permit(:content, :title, :photo)
  end
end
