class ChangeData < ActiveRecord::Migration[7.0]
  def change
    change_column :books, :description, :text
  end
end
