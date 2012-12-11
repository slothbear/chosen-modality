class ApplicationController < ActionController::Base
  protect_from_forgery

  def isolate_new_modalities(params)
    modality_ids = params.delete(:modality_ids)
    remove_blanks_added_by_chosen(modality_ids)

    # FIX: direct modification of params... not good.
    params[:modality_ids], params[:new_modalities] =
      modality_ids.partition { |id| integer?(id) }
    params
  end

  private

  # TODO: [RESEARCH] Is the extra blank value normal behavior for Chosen? (Card #6)
  def remove_blanks_added_by_chosen(arr)
    arr.reject!(&:empty?)
  end

  # TODO: [THANKS] To Sarah Mei [1].
  def integer?(value)
    value.to_i.to_s == value
  end

end

# [1] http://stackoverflow.com/questions/1235863/test-if-a-string-is-basically-an-integer-in-quotes-using-ruby