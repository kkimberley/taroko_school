class CreatePaths < ActiveRecord::Migration[5.0]
  def change
    create_table :paths do |t|
      t.string :title
      t.text :url

      t.timestamps
    end
  end
end
