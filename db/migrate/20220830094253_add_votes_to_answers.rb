class AddVotesToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :answers, :votes, :integer, default: 0
  end
end
