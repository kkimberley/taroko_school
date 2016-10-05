class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :url
      t.text :description
      t.references :path, foreign_key: true

      t.timestamps
    end
  end
end
