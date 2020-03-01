class CreateWines < ActiveRecord::Migration[6.0]
  def change
    create_table :wines do |t|
      t.string :region
      t.string :notes
      t.string :grapeVariety
      t.string :wineType
      t.integer :vintage
      t.string :label
      t.float :price
      t.string :image

      t.timestamps
    end
  end
end
