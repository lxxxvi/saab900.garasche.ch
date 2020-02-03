class AddUploads < ActiveRecord::Migration[6.0]
  def change
    create_table :uploads do |t|
      t.string :file, null: false
      t.text :comment, null: true
      t.datetime :approved_at, null: true

      t.timestamps
    end
  end
end
