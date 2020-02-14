class AddTitleToUploads < ActiveRecord::Migration[6.0]
  def change
    add_column :uploads, :title, :string
  end
end
