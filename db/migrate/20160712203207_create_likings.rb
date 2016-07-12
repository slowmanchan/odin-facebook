class CreateLikings < ActiveRecord::Migration
  def change
    create_table :likings do |t|
      t.integer :post_id
      t.integer :user_id
      t.boolean :like


      t.timestamps null: false
    end
  end
end
