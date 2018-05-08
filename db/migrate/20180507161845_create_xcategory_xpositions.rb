class CreateXcategoryXpositions < ActiveRecord::Migration[5.1]
  def change
    create_table :xcategory_xpositions do |t|
      t.belongs_to :xcategory, index: true
      t.belongs_to :xposition, index: true
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
