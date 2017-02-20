require 'rails_helper'

RSpec.describe Product, type: :model do

  context "Validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price_cents) }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_numericality_of(:quantity) }
    it { is_expected.to validate_presence_of(:category_id) }
  end

  # Test for success
  context "Product that is valid" do
    before(:each) do
      @category = Category.create(name: "Furniture")
      @product = Product.new({
        name: "Racecar Bed",
        price_cents: 696969,
        quantity: 69,
        category_id: @category.id
        })
    end

    it "Should have a name" do
      expect(@product.name).to eq("Racecar Bed")
      expect{@product.name}.to_not raise_error
    end

    it "Should have a valid price " do
      expect(@product.price_cents).to be_an_instance_of(Fixnum)
      expect(@product.price_cents).to eq(696969)
    end

    it "Should have a valid quantity that equals" do
      expect(@product.quantity).to eq(69)
    end

    it "Should have a valid category_id" do
      expect(@product.category_id).to be_an_instance_of(Fixnum)
    end
  end

  # Tests for failure
  context "Product without a valid name" do
    it "Should not have a valid name" do
      @product = Product.create({
        name: nil,
        price_cents: 10000,
        quantity: 100,
        category_id: 1
        })
      expect(@product.name).to eq(nil)
    end
  end

  # Test returned 0 for price
  context "Product without a valid price" do
    it "Should not have a valid price" do
      @product = Product.create({
        name: "jet ski",
        price_cents: nil,
        quantity: 100,
        category_id: 1
        })
      expect(@product.errors.full_messages).to include("Price cents is not a number")
    end
  end

  context "Product without a valid quantity" do
    it "Should not have a valid quantity" do
      @product = Product.create({
        name: "jet ski",
        price_cents: 54321,
        quantity: nil,
        category_id: 1
        })
      expect(@product.errors.full_messages).to include("Quantity is not a number")
    end
  end

  context "Product without a valid category_id" do
    it "Should not have a valid category_id" do
      @product = Product.create({
        name: "jet ski",
        price_cents: 54321,
        quantity: 123,
        category_id: nil
        })
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end

end
