class ChangeColumnUrlToDescription < ActiveRecord::Migration[5.0]
  def change
    rename_column :paths, :url, :description
  end
end
