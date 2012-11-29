require 'test_helper'

class ModalitiesControllerTest < ActionController::TestCase

  test "separate new and existing modalities" do
    params = {:modality_ids => ["42", "Sleep Therapy"]}
    @controller.send(:isolate_new_modalities, isolate_new_modalities, params)

    assert_equal ["42"], params[:modality_ids]
    assert_equal ["Sleep Therapy"], params[:new_modalities]
  end

  test "multiple old and new modalities" do
    params = {:modality_ids => ["3", "Hot Yoga", "Diet", "18"]}
    @controller.send(:isolate_new_modalities, isolate_new_modalities, params)

    assert_equal ["3", "18"], params[:modality_ids]
    assert_equal ["Hot Yoga", "Diet"], params[:new_modalities]
  end

  test "single new modality" do
    params = {:modality_ids => ["Cupping"]}
    @controller.send(:isolate_new_modalities, isolate_new_modalities, params)

    assert_equal [], params[:modality_ids]
    assert_equal ["Cupping"], params[:new_modalities]
  end

  test "handle empty modalities" do
    params = {:modality_ids => []}
    @controller.send(:isolate_new_modalities, isolate_new_modalities, params)

    assert_equal [], params[:modality_ids]
    assert_equal [], params[:new_modalities]
  end

end
