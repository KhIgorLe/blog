class AddAuthorToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :author, :string, null: false
  end
end
