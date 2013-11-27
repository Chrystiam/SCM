require 'test_helper'

class FcomitesControllerTest < ActionController::TestCase
  setup do
    @fcomite = fcomites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fcomites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fcomite" do
    assert_difference('Fcomite.count') do
      post :create, fcomite: { fecha: @fcomite.fecha, lugar: @fcomite.lugar }
    end

    assert_redirected_to fcomite_path(assigns(:fcomite))
  end

  test "should show fcomite" do
    get :show, id: @fcomite
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fcomite
    assert_response :success
  end

  test "should update fcomite" do
    put :update, id: @fcomite, fcomite: { fecha: @fcomite.fecha, lugar: @fcomite.lugar }
    assert_redirected_to fcomite_path(assigns(:fcomite))
  end

  test "should destroy fcomite" do
    assert_difference('Fcomite.count', -1) do
      delete :destroy, id: @fcomite
    end

    assert_redirected_to fcomites_path
  end
end
