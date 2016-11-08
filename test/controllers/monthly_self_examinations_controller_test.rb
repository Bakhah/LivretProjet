require 'test_helper'

class MonthlySelfExaminationsControllerTest < ActionController::TestCase
  setup do
    @monthly_self_examination = monthly_self_examinations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:monthly_self_examinations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create monthly_self_examination" do
    assert_difference('MonthlySelfExamination.count') do
      post :create, monthly_self_examination: { periode: @monthly_self_examination.periode, what_ive_done: @monthly_self_examination.what_ive_done, what_ive_felt: @monthly_self_examination.what_ive_felt, what_ive_learnt: @monthly_self_examination.what_ive_learnt }
    end

    assert_redirected_to monthly_self_examination_path(assigns(:monthly_self_examination))
  end

  test "should show monthly_self_examination" do
    get :show, id: @monthly_self_examination
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @monthly_self_examination
    assert_response :success
  end

  test "should update monthly_self_examination" do
    patch :update, id: @monthly_self_examination, monthly_self_examination: { periode: @monthly_self_examination.periode, what_ive_done: @monthly_self_examination.what_ive_done, what_ive_felt: @monthly_self_examination.what_ive_felt, what_ive_learnt: @monthly_self_examination.what_ive_learnt }
    assert_redirected_to monthly_self_examination_path(assigns(:monthly_self_examination))
  end

  test "should destroy monthly_self_examination" do
    assert_difference('MonthlySelfExamination.count', -1) do
      delete :destroy, id: @monthly_self_examination
    end

    assert_redirected_to monthly_self_examinations_path
  end
end
