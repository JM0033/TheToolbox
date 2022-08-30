class AddTitleToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :title, :string
  end
end
