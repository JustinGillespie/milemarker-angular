class AddRollToUser < ActiveRecord::Migration
  def change
    add_column :users, :roll, :integer
  end
end
