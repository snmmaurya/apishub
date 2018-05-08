class CreateXpositions < ActiveRecord::Migration[5.1]
  def change
    create_table :xpositions do |t|
      t.string :title
      t.text :description
      t.string :image
      t.belongs_to :xcategory, index: true
      t.integer :status, default: 0
      t.timestamps
    end
  end
end