class Practitioner < ActiveRecord::Base
  attr_accessible :modality_id, :name
  belongs_to :modality

  validates_presence_of :name, :modality
end
