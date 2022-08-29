class AddTitleToQuestions < ActiveRecord::Migration[7.0]
  def change
    t.string :title
  end
end
