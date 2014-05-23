class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.integer :creator_id
      t.string :name
      t.string :image_url

      t.timestamps
    end
  end
end
