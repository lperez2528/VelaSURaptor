class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :taker_id
      t.integer :survey_id
      t.timestamps
    end
  end
end
