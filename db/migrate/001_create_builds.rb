class CreateBuilds < ActiveRecord::Migration
  def change
    create_table :builds do |t|
      t.string :title
      t.text :note
      t.string :number
      t.string :owner_name

      t.integer :build_type_id, :null => false
      t.integer :project_id, :null => false
      
      t.timestamps
    end

    create_table :build_types do |t|
      t.string :name
      t.string :exe_path
      t.string :output_path
      t.timestamps
    end
  end
end
