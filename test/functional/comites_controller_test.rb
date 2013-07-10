require 'test_helper'

class ComitesControllerTest < ActionController::TestCase
  setup do
    @comite = comites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comite" do
    assert_difference('Comite.count') do
      post :create, comite: { fecha: @comite.fecha, hora: @comite.hora, lugar: @comite.lugar }
    end

    assert_redirected_to comite_path(assigns(:comite))
  end

  test "should show comite" do
    get :show, id: @comite
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comite
    assert_response :success
  end

  test "should update comite" do
    put :update, id: @comite, comite: { fecha: @comite.fecha, hora: @comite.hora, lugar: @comite.lugar }
    assert_redirected_to comite_path(assigns(:comite))
  end

  test "should destroy comite" do
    assert_difference('Comite.count', -1) do
      delete :destroy, id: @comite
    end

    assert_redirected_to comites_path
  end
end
