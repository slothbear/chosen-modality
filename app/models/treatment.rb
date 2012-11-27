class Treatment < ActiveRecord::Base
  attr_accessible :modality_id, :practitioner_id

  belongs_to :practitioner
  belongs_to :modality
end
