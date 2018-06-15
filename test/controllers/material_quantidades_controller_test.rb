require 'test_helper'

class MaterialQuantidadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @material_quantidade = material_quantidades(:one)
  end

  test "should get index" do
    get material_quantidades_url
    assert_response :success
  end

  test "should get new" do
    get new_material_quantidade_url
    assert_response :success
  end

  test "should create material_quantidade" do
    assert_difference('MaterialQuantidade.count') do
      post material_quantidades_url, params: { material_quantidade: { material_id: @material_quantidade.material_id, quantidade: @material_quantidade.quantidade } }
    end

    assert_redirected_to material_quantidade_url(MaterialQuantidade.last)
  end

  test "should show material_quantidade" do
    get material_quantidade_url(@material_quantidade)
    assert_response :success
  end

  test "should get edit" do
    get edit_material_quantidade_url(@material_quantidade)
    assert_response :success
  end

  test "should update material_quantidade" do
    patch material_quantidade_url(@material_quantidade), params: { material_quantidade: { material_id: @material_quantidade.material_id, quantidade: @material_quantidade.quantidade } }
    assert_redirected_to material_quantidade_url(@material_quantidade)
  end

  test "should destroy material_quantidade" do
    assert_difference('MaterialQuantidade.count', -1) do
      delete material_quantidade_url(@material_quantidade)
    end

    assert_redirected_to material_quantidades_url
  end
end
