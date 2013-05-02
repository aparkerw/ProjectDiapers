require 'test_helper'

class ResumeDocsControllerTest < ActionController::TestCase
  setup do
    @resume_doc = resume_docs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:resume_docs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create resume_doc" do
    assert_difference('ResumeDoc.count') do
      post :create, resume_doc: { original_resume_html: @resume_doc.original_resume_html, owner_name: @resume_doc.owner_name, private_guid: @resume_doc.private_guid, safe_resume_html: @resume_doc.safe_resume_html }
    end

    assert_redirected_to resume_doc_path(assigns(:resume_doc))
  end

  test "should show resume_doc" do
    get :show, id: @resume_doc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @resume_doc
    assert_response :success
  end

  test "should update resume_doc" do
    put :update, id: @resume_doc, resume_doc: { original_resume_html: @resume_doc.original_resume_html, owner_name: @resume_doc.owner_name, private_guid: @resume_doc.private_guid, safe_resume_html: @resume_doc.safe_resume_html }
    assert_redirected_to resume_doc_path(assigns(:resume_doc))
  end

  test "should destroy resume_doc" do
    assert_difference('ResumeDoc.count', -1) do
      delete :destroy, id: @resume_doc
    end

    assert_redirected_to resume_docs_path
  end
end
