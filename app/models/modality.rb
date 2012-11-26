class Modality < ActiveRecord::Base
  attr_accessible :name, :standard

  def to_s
    name
  end
end
