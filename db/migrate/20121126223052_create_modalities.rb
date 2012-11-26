class CreateModalities < ActiveRecord::Migration
  def change
    create_table :modalities do |t|
      t.string :name
      t.integer :standard

      t.timestamps
    end
  end
end
