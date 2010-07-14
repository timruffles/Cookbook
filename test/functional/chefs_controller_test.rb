require 'test_helper'

class ChefsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chefs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chef" do
    assert_difference('Chef.count') do
      post :create, :chef => { }
    end

    assert_redirected_to chef_path(assigns(:chef))
  end

  test "should show chef" do
    get :show, :id => chefs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => chefs(:one).to_param
    assert_response :success
  end

  test "should update chef" do
    put :update, :id => chefs(:one).to_param, :chef => { }
    assert_redirected_to chef_path(assigns(:chef))
  end

  test "should destroy chef" do
    assert_difference('Chef.count', -1) do
      delete :destroy, :id => chefs(:one).to_param
    end

    assert_redirected_to chefs_path
  end
end
