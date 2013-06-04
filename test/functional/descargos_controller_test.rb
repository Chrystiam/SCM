require 'test_helper'

class DescargosControllerTest < ActionController::TestCase
  setup do
    @descargo = descargos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:descargos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create descargo" do
    assert_difference('Descargo.count') do
      post :create, descargo: { descripcion: @descargo.descripcion }
    end

    assert_redirected_to descargo_path(assigns(:descargo))
  end

  test "should show descargo" do
    get :show, id: @descargo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @descargo
    assert_response :success
  end

  test "should update descargo" do
    put :update, id: @descargo, descargo: { descripcion: @descargo.descripcion }
    assert_redirected_to descargo_path(assigns(:descargo))
  end

  test "should destroy descargo" do
    assert_difference('Descargo.count', -1) do
      delete :destroy, id: @descargo
    end

    assert_redirected_to descargos_path
  end
end
