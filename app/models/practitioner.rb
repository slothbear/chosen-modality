class Practitioner < ActiveRecord::Base
  attr_accessible :modality_id, :name, :modality_ids

  belongs_to :modality
  has_many :treatments, :dependent => :destroy
  has_many :modalities, :through => :treatments

  validates_presence_of :name, :modality
end
