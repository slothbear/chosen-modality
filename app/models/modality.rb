class Modality < ActiveRecord::Base
  attr_accessible :name, :standard
  validates_presence_of :name

  scope :standard, order(:name)

  def to_s
    name
  end

  def self.isolate_new_modalities(params)
    modality_ids = params.delete(:modality_ids)

    # FIX: direct modification of params... not good.
    params[:modality_ids], params[:new_modalities] =
      modality_ids.partition { |id| integer?(id) }
    params
  end

  private

  def self.integer?(value)
    value.to_i.to_s == value
  end

end
