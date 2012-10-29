class RemoveFieldNameFromRole < ActiveRecord::Migration
  def up
    remove_column :roles, :created_at
    remove_column :roles, :updated_at
  end

  def down
    add_column :roles, :updated_at, :string
    add_column :roles, :created_at, :string
  end
end
