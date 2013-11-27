require 'test_helper'

class AsignacioncomitesControllerTest < ActionController::TestCase
  setup do
    @asignacioncomite = asignacioncomites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asignacioncomites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asignacioncomite" do
    assert_difference('Asignacioncomite.count') do
      post :create, asignacioncomite: { apellidos: @asignacioncomite.apellidos, ficha: @asignacioncomite.ficha, nombres: @asignacioncomite.nombres, programa: @asignacioncomite.programa }
    end

    assert_redirected_to asignacioncomite_path(assigns(:asignacioncomite))
  end

  test "should show asignacioncomite" do
    get :show, id: @asignacioncomite
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asignacioncomite
    assert_response :success
  end

  test "should update asignacioncomite" do
    put :update, id: @asignacioncomite, asignacioncomite: { apellidos: @asignacioncomite.apellidos, ficha: @asignacioncomite.ficha, nombres: @asignacioncomite.nombres, programa: @asignacioncomite.programa }
    assert_redirected_to asignacioncomite_path(assigns(:asignacioncomite))
  end

  test "should destroy asignacioncomite" do
    assert_difference('Asignacioncomite.count', -1) do
      delete :destroy, id: @asignacioncomite
    end

    assert_redirected_to asignacioncomites_path
  end
end
