if @question.persisted?
  json.form render(partial: "questions/form", formats: :html, locals: { question: Question.new })
  json.inserted_item render(partial: "questions/question", formats: :html, locals: { question: @question })
  json.counter pluralize(Question.count, "question", "questions")
else
  json.form render(partial: "questions/form", formats: :html, locals: { question: @question })
end
