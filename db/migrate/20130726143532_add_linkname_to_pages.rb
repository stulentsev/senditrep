class AddLinknameToPages < ActiveRecord::Migration
  def change
    add_column :pages, :linkname, :string
  end
end
