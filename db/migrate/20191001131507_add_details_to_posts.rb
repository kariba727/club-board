class AddDetailsToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :name, :string
    add_column :posts, :genre, :integer
    add_column :posts, :school, :string
    add_column :posts, :body, :text
    add_column :posts, :people, :integer
    add_column :posts, :hi, :string
    add_column :posts, :activeday, :string
  end
end
