class AddDetailsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    add_column :users, :description, :string
    add_column :users, :biker_status, :string
    add_column :users, :bike_model, :string
    add_column :users, :language, :string
  end
end
