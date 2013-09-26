class RemoveLinkFromPage < ActiveRecord::Migration
  def up
    remove_column :pages, :link
  end

  def down
    add_column :pages, :link, :string
  end
end
