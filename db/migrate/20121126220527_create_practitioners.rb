class CreatePractitioners < ActiveRecord::Migration
  def change
    create_table :practitioners do |t|
      t.string :name
      t.integer :modality

      t.timestamps
    end
  end
end
