class RenameStartAtColumnToPostWorks < ActiveRecord::Migration[6.1]
  def change
    rename_column :post_works, :start_at, :start_time
    rename_column :post_works, :end_at, :end_time
  end
end
