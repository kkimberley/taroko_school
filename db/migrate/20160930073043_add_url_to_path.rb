class AddUrlToPath < ActiveRecord::Migration[5.0]
  def change
    add_column :paths, :url, :string
  end
end
