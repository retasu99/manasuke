class RenameStartTimeColumnToPostWorks < ActiveRecord::Migration[6.1]
  def change
    rename_column :post_works, :start_time, :start_at
  end
end
