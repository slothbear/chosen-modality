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

  attr_accessible :modality_id, :name, :modality_ids, :modality_other, :new_modalities

  attr_accessor :modality_other, :new_modalities

  belongs_to :modality
  has_many :treatments, :dependent => :destroy
  has_many :modalities, :through => :treatments

  validates_presence_of :name, :modality, :modalities

  after_initialize :default_values
  before_save :create_other_modality
  before_save :create_new_modalities

  private
    def default_values
      self.name = name || "Dr. #{NAMES.sample}"
      self.modality = modality || Modality.standard.sample
    end

    # FIX: (TELL¬ASK) Modality should be in charge of creating modalities.
    # FIX: use guard/return like #create_new_modalities?
    def create_other_modality
      if modality_other.present?
        self.modality = Modality.find_or_create_by_name(modality_other)
      end
    end

    # FIX: (TELL¬ASK) Modality should be in charge of creating modalities, not us.
    def create_new_modalities
      return unless new_modalities.present?

      new_modalities.each do |modality_name|
        if modality_name.present?
          self.modalities << Modality.find_or_create_by_name(modality_name)
        end
      end
    end

end
