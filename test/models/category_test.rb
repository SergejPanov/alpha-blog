require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

    def setup
        @category = Category.new(name: "Sporty")
    end

    test "category should be valid" do
        assert @category.valid?
    end

    test "Name should be present" do
        @category.name = " "
        assert_not @category.valid?
    end

    test "Name should be unique" do
        @category.save
        @category2 = Category.new(name: "Sporty")
        assert_not @category2.valid?
    end

    test "Name should not be too long" do
        @category.name = "a" * 26
        assert_not @category.valid?
    end

    test "Name should not be too short" do
        @category.name = "a" * 2
        assert_not @category.valid?
    end
end