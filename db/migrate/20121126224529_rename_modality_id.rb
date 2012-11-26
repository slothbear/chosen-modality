class RenameModalityId < ActiveRecord::Migration
  def change
    rename_column :practitioners, :modality, :modality_id
  end
end
