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
  before_save :create_new_modality

  private
    def default_values
      self.name = name || "Dr. #{NAMES.sample}"
      self.modality = modality || Modality.standard.sample
    end

    # FIX: Modality should be in charge of creating modalities, not us.
    def create_new_modality
      if modality_other.present?
        self.modality = Modality.find_or_create_by_name(modality_other)
      end
    end

end
