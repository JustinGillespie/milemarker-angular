class RemoveRollFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :roll, :string
  end
end
