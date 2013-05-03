require 'test_helper'

class SkillSuggestionsControllerTest < ActionController::TestCase
  setup do
    @skill_suggestion = skill_suggestions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:skill_suggestions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create skill_suggestion" do
    assert_difference('SkillSuggestion.count') do
      post :create, skill_suggestion: { bid: @skill_suggestion.bid, resume_doc_guid: @skill_suggestion.resume_doc_guid, skill: @skill_suggestion.skill }
    end

    assert_redirected_to skill_suggestion_path(assigns(:skill_suggestion))
  end

  test "should show skill_suggestion" do
    get :show, id: @skill_suggestion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @skill_suggestion
    assert_response :success
  end

  test "should update skill_suggestion" do
    put :update, id: @skill_suggestion, skill_suggestion: { bid: @skill_suggestion.bid, resume_doc_guid: @skill_suggestion.resume_doc_guid, skill: @skill_suggestion.skill }
    assert_redirected_to skill_suggestion_path(assigns(:skill_suggestion))
  end

  test "should destroy skill_suggestion" do
    assert_difference('SkillSuggestion.count', -1) do
      delete :destroy, id: @skill_suggestion
    end

    assert_redirected_to skill_suggestions_path
  end
end
