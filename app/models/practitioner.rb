class Practitioner < ActiveRecord::Base
  NAMES = [
    'Marge Innovera',
    'Haywood Jabuzoff',
    'Claudio Vernight',
    'C.F. Eye Care',
    'Pikov Andropov',
    'Warren Peace',
    'Imelda Czechs',
    'Bjorn A. Payne Diaz',
    'Wilma Butfit',
    'Barbara Ganush',
    'Lois Steem',
    'Rusty Steele',
    'Denton Fender',
    'Denton Fender',
    'Selma Kayak',
    ]

  attr_accessible :modality_id, :name, :modality_ids, :modality_other
  attr_accessor :modality_other

  belongs_to :modality
  has_many :treatments, :dependent => :destroy
  has_many :modalities, :through => :treatments

  validates_presence_of :name, :modality, :modalities

  after_initialize :default_values

  private
    def default_values
      self.name = name || "Dr. #{NAMES.sample}"
    end

end
