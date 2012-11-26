class Practitioner < ActiveRecord::Base
  attr_accessible :modality, :name
  belongs_to :modality
end
