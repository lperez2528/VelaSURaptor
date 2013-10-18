class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.integer :creator_id
      t.text :description
      t.string :title
      t.timestamps
    end
  end
end
