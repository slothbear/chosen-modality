class Modality < ActiveRecord::Base
  attr_accessible :name, :standard
  validates_presence_of :name

  def to_s
    name
  end
end
