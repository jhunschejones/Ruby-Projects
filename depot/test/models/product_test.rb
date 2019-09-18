require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  describe "product price validation" do
    setup do
      @product = Product.new(
        title: "My Book Title",
        description: "A truly test-worthy tome.",
        image_url: "https://images-na.ssl-images-amazon.com/images/I/51zXumFxDpL._SX308_BO1,204,203,200_.jpg"
      )
    end

    test "price must be a number" do
      @product.price = "pretty expensive"
      assert @product.invalid?
      assert_equal ["is not a number"], @product.errors[:price]
    end

    test "price cannot be negative" do
      @product.price = -1
      assert @product.invalid?
      assert_equal ["must be greater than or equal to 0.01"], @product.errors[:price]
    end

    test "price should be greater than 0" do
      @product.price = 0
      assert @product.invalid?
      assert_equal ["must be greater than or equal to 0.01"], @product.errors[:price]
    end

    test "valid price should have no errors" do
      @product.price = 1
      assert @product.valid?
    end
  end

  # Currently, `image_url`s are only validated by file extension
  describe "image_url validation" do
    test "valid image extensions are accepted" do
      %w{ http://google.image.gif http://google.image.jpg http://google.image.png }.each do |url|
        product = Product.new(title: "test product", description: "looks familiar", price: 1, image_url: url)
        assert product.valid?
      end
    end

    test "invalid image extensions are not accepted" do
      %w{ http://google.image.doc http://google.image.html http://google.image.htm }.each do |url|
        product = Product.new(title: "test product", description: "Déjà vu", price: 1, image_url: url)
        assert product.invalid?
      end
    end

    test "product cannot have a duplicate title" do
      product = Product.new(
        title: products(:ruby).title,
        description: "Duplicate product",
        price: 1,
        image_url: "fred.gif"
      )

      assert product.invalid?
      assert_equal ["has already been taken"], product.errors[:title]
    end
  end
end
