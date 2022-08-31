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
    @question.user = current_user

    respond_to do |format|
      if @question.save
        flash[:notice] = "Your question has successfully been submitted"
        format.json
      else
        format.json
      end
    end
  end

  private

  def question_params
    params.require(:question).permit(:content, :title, :photo)
  end
end
