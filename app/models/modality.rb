class Modality < ActiveRecord::Base
  attr_accessible :name, :standard
  validates_presence_of :name

  scope :standard, where(:standard => true).order("name")
  scope :other, where(['name = ?', 'other modality...'])

  def to_s
    name
  end

  def self.with_other
    self.standard << self.other.first
  end

end
