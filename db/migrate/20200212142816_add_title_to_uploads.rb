class AddTitleToUploads < ActiveRecord::Migration[6.0]
  def change
    add_column :uploads, :title, :string
    migrate_title
    change_column_null :uploads, :title, false
  end

  private

  def migrate_title
    execute <<~SQL
      UPDATE uploads
         SET title = 'Titel'
       WHERE title IS NULL
    SQL
  end
end
