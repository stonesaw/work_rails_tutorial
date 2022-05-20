require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @update = {
      title: "xxx",
      description: "any",
      image_url: "ruby.jpg",
      price: 19.95
    }
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    p "=== create"
    pp Product.count
    pp Product.all
    assert_difference("Product.count") do
      post "/products", params: { product: @update }
      pp Product.last
    end
    
    assert_redirected_to product_path(assigns(@product))
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    # p "=== update"
    # pp @update
    put "/products/#{@product.id}", params: { product: @update.merge(id: @product.id, title: "xxx") }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference("Product.count", -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
