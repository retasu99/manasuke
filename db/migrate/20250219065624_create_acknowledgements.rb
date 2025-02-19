class CreateAcknowledgements < ActiveRecord::Migration[6.1]
  def change
    create_table :acknowledgements do |t|
      t.integer :user_id
      t.integer :post_work_id

      t.timestamps
    end
  end
end
