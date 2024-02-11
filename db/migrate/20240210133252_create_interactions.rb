class CreateInteractions < ActiveRecord::Migration[7.0]
  def change
    create_table :interactions do |t|
      t.text :content
      t.references :contact, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
