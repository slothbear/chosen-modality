class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.integer :practitioner_id
      t.integer :modality_id

      t.timestamps
    end
  end
end
