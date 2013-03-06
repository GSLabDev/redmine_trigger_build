class CreateBuilds < ActiveRecord::Migration
  def change
    create_table :builds do |t|
      t.integer :project_id, :null => false
      t.string :title
      t.text :note
      t.integer :user_id, :null => false
      t.timestamps
    end
  end
end
