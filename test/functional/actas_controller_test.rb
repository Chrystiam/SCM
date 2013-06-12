require 'test_helper'

class ActasControllerTest < ActionController::TestCase
  setup do
    @acta = actas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:actas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create acta" do
    assert_difference('Acta.count') do
      post :create, acta: { ciudad: @acta.ciudad, conclusiones: @acta.conclusiones, desarrollo_reunion: @acta.desarrollo_reunion, fecha: @acta.fecha, firmas: @acta.firmas, hora_inicio: @acta.hora_inicio, hora_terminacion: @acta.hora_terminacion, lugar: @acta.lugar, objetivo_de_la_reunion: @acta.objetivo_de_la_reunion, tema: @acta.tema }
    end

    assert_redirected_to acta_path(assigns(:acta))
  end

  test "should show acta" do
    get :show, id: @acta
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @acta
    assert_response :success
  end

  test "should update acta" do
    put :update, id: @acta, acta: { ciudad: @acta.ciudad, conclusiones: @acta.conclusiones, desarrollo_reunion: @acta.desarrollo_reunion, fecha: @acta.fecha, firmas: @acta.firmas, hora_inicio: @acta.hora_inicio, hora_terminacion: @acta.hora_terminacion, lugar: @acta.lugar, objetivo_de_la_reunion: @acta.objetivo_de_la_reunion, tema: @acta.tema }
    assert_redirected_to acta_path(assigns(:acta))
  end

  test "should destroy acta" do
    assert_difference('Acta.count', -1) do
      delete :destroy, id: @acta
    end

    assert_redirected_to actas_path
  end
end
