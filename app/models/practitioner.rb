class Practitioner < ActiveRecord::Base
  attr_accessible :modality_id, :name
  belongs_to :modality
end
