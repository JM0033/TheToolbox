class CreateChatrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :chatrooms do |t|
      t.references :first_user, index: true, foreign_key: { to_table: :users }, null: false
      t.references :second_user, index: true, foreign_key: { to_table: :users }, null: false
      t.timestamps
    end
  end
end
