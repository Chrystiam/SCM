require 'test_helper'

class FaltasControllerTest < ActionController::TestCase
  setup do
    @falta = faltas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:faltas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create falta" do
    assert_difference('Falta.count') do
      post :create, falta: { descripcion: @falta.descripcion, falta: @falta.falta }
    end

    assert_redirected_to falta_path(assigns(:falta))
  end

  test "should show falta" do
    get :show, id: @falta
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @falta
    assert_response :success
  end

  test "should update falta" do
    put :update, id: @falta, falta: { descripcion: @falta.descripcion, falta: @falta.falta }
    assert_redirected_to falta_path(assigns(:falta))
  end

  test "should destroy falta" do
    assert_difference('Falta.count', -1) do
      delete :destroy, id: @falta
    end

    assert_redirected_to faltas_path
  end
end
