class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    @question = @answer.question(:question_id)
    if @answer.save!
      flash[:notice] = "Your answer has successfully been submitted"
      redirect_to questions_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
