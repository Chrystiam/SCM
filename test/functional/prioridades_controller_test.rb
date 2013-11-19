require 'test_helper'

class PrioridadesControllerTest < ActionController::TestCase
  setup do
    @prioridad = prioridades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prioridades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prioridad" do
    assert_difference('Prioridad.count') do
      post :create, prioridad: { nombre: @prioridad.nombre }
    end

    assert_redirected_to prioridad_path(assigns(:prioridad))
  end

  test "should show prioridad" do
    get :show, id: @prioridad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prioridad
    assert_response :success
  end

  test "should update prioridad" do
    put :update, id: @prioridad, prioridad: { nombre: @prioridad.nombre }
    assert_redirected_to prioridad_path(assigns(:prioridad))
  end

  test "should destroy prioridad" do
    assert_difference('Prioridad.count', -1) do
      delete :destroy, id: @prioridad
    end

    assert_redirected_to prioridades_path
  end
end
