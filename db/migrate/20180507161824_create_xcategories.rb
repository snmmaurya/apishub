class CreateXcategories < ActiveRecord::Migration[5.1]
  def change
    create_table :xcategories do |t|
      t.string :name
      t.string :image
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
