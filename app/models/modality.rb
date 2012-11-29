class Modality < ActiveRecord::Base
  attr_accessible :name, :standard
  validates_presence_of :name

  scope :standard, order(:name)

  def to_s
    name
  end

  def self.old_method
    order(:name) << self.new(:name => "other modality...")
  end

end
