class Modality < ActiveRecord::Base
  attr_accessible :name, :standard
  validates_presence_of :name

  scope :standard, where(:standard => true).order("name")

  def to_s
    name
  end

end
