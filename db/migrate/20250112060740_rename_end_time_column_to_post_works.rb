class RenameEndTimeColumnToPostWorks < ActiveRecord::Migration[6.1]
  def change
    rename_column :post_works, :end_time, :end_at
  end
end
