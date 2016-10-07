class CreateMissions < ActiveRecord::Migration[5.0]
  def change
    create_table :missions do |t|
      t.string :title
      t.text :description
      t.text :url
      t.boolean :if_finish
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
