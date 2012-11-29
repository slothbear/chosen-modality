class Modality < ActiveRecord::Base
  attr_accessible :name, :standard
  validates_presence_of :name

  scope :standard, order(:name)

  def to_s
    name
  end

  def self.isolate_new_modalities(params)
    modality_ids = params.delete(:modality_ids)
    remove_blanks_added_by_chosen(modality_ids)

    # FIX: direct modification of params... not good.
    params[:modality_ids], params[:new_modalities] =
      modality_ids.partition { |id| integer?(id) }
    params
  end

  private

  # TODO: is this normal behavior for Chosen?
  def self.remove_blanks_added_by_chosen(arr)
    arr.reject!(&:empty?)
  end

  def self.integer?(value)
    value.to_i.to_s == value
  end

end
