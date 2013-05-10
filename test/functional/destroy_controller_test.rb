require 'test_helper'

class DestroyControllerTest < ActionController::TestCase
  setup do
    @destroy = destroy(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:destroy)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create destroy" do
    assert_difference('Destroy.count') do
      post :create, destroy: { cargo: @destroy.cargo, descripcion: @destroy.descripcion }
    end

    assert_redirected_to destroy_path(assigns(:destroy))
  end

  test "should show destroy" do
    get :show, id: @destroy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @destroy
    assert_response :success
  end

  test "should update destroy" do
    put :update, id: @destroy, destroy: { cargo: @destroy.cargo, descripcion: @destroy.descripcion }
    assert_redirected_to destroy_path(assigns(:destroy))
  end

  test "should destroy destroy" do
    assert_difference('Destroy.count', -1) do
      delete :destroy, id: @destroy
    end

    assert_redirected_to destroy_index_path
  end
end
