require 'test_helper'

class CategoriasControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'should get index' do
    get categorias_path
    assert_response :success
  end
end
