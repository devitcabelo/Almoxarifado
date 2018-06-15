require "application_system_test_case"

class MaterialQuantidadesTest < ApplicationSystemTestCase
  setup do
    @material_quantidade = material_quantidades(:one)
  end

  test "visiting the index" do
    visit material_quantidades_url
    assert_selector "h1", text: "Material Quantidades"
  end

  test "creating a Material quantidade" do
    visit material_quantidades_url
    click_on "New Material Quantidade"

    fill_in "Material", with: @material_quantidade.material_id
    fill_in "Quantidade", with: @material_quantidade.quantidade
    click_on "Create Material quantidade"

    assert_text "Material quantidade was successfully created"
    click_on "Back"
  end

  test "updating a Material quantidade" do
    visit material_quantidades_url
    click_on "Edit", match: :first

    fill_in "Material", with: @material_quantidade.material_id
    fill_in "Quantidade", with: @material_quantidade.quantidade
    click_on "Update Material quantidade"

    assert_text "Material quantidade was successfully updated"
    click_on "Back"
  end

  test "destroying a Material quantidade" do
    visit material_quantidades_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Material quantidade was successfully destroyed"
  end
end
