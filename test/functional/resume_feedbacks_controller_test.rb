require 'test_helper'

class ResumeFeedbacksControllerTest < ActionController::TestCase
  setup do
    @resume_feedback = resume_feedbacks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:resume_feedbacks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create resume_feedback" do
    assert_difference('ResumeFeedback.count') do
      post :create, resume_feedback: { bid: @resume_feedback.bid, feedback_type: @resume_feedback.feedback_type, json_data: @resume_feedback.json_data, name: @resume_feedback.name, note: @resume_feedback.note, resume_doc_guid: @resume_feedback.resume_doc_guid }
    end

    assert_redirected_to resume_feedback_path(assigns(:resume_feedback))
  end

  test "should show resume_feedback" do
    get :show, id: @resume_feedback
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @resume_feedback
    assert_response :success
  end

  test "should update resume_feedback" do
    put :update, id: @resume_feedback, resume_feedback: { bid: @resume_feedback.bid, feedback_type: @resume_feedback.feedback_type, json_data: @resume_feedback.json_data, name: @resume_feedback.name, note: @resume_feedback.note, resume_doc_guid: @resume_feedback.resume_doc_guid }
    assert_redirected_to resume_feedback_path(assigns(:resume_feedback))
  end

  test "should destroy resume_feedback" do
    assert_difference('ResumeFeedback.count', -1) do
      delete :destroy, id: @resume_feedback
    end

    assert_redirected_to resume_feedbacks_path
  end
end
