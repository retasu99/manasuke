class CreatePostWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :post_works do |t|

      t.integer :project_id
      t.integer :user_id
      t.string :name
      t.text :work
      t.string :area
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
