class AddDialectToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :dialect, :integer
  end
end
