require 'test_helper'

class UsercomitesControllerTest < ActionController::TestCase
  setup do
    @usercomite = usercomites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usercomites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usercomite" do
    assert_difference('Usercomite.count') do
      post :create, usercomite: { cedula: @usercomite.cedula, email: @usercomite.email, fch_ncto: @usercomite.fch_ncto, nc: @usercomite.nc }
    end

    assert_redirected_to usercomite_path(assigns(:usercomite))
  end

  test "should show usercomite" do
    get :show, id: @usercomite
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @usercomite
    assert_response :success
  end

  test "should update usercomite" do
    put :update, id: @usercomite, usercomite: { cedula: @usercomite.cedula, email: @usercomite.email, fch_ncto: @usercomite.fch_ncto, nc: @usercomite.nc }
    assert_redirected_to usercomite_path(assigns(:usercomite))
  end

  test "should destroy usercomite" do
    assert_difference('Usercomite.count', -1) do
      delete :destroy, id: @usercomite
    end

    assert_redirected_to usercomites_path
  end
end
