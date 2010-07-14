require 'test_helper'

class CooksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cooks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cook" do
    assert_difference('Cook.count') do
      post :create, :cook => { }
    end

    assert_redirected_to cook_path(assigns(:cook))
  end

  test "should show cook" do
    get :show, :id => cooks(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => cooks(:one).to_param
    assert_response :success
  end

  test "should update cook" do
    put :update, :id => cooks(:one).to_param, :cook => { }
    assert_redirected_to cook_path(assigns(:cook))
  end

  test "should destroy cook" do
    assert_difference('Cook.count', -1) do
      delete :destroy, :id => cooks(:one).to_param
    end

    assert_redirected_to cooks_path
  end
end
