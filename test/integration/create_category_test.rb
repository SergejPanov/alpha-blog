require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest

  setup do
    @admin_user = User.create(username: "test_admin", email: "test_admin@g.com", password: "pass", admin: true)  
    sign_in_as(@admin_user)
  end

  test "Get new category form and create category" do
      get "/categories/new"
      assert_response :success
    assert_difference 'Category.count', 1 do
      post categories_path, params: { category: { name: "Lib"}}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Lib", response.body
   end

   test "Get new category form and reject invalid category" do
    get "/categories/new"
    assert_response :success
  assert_no_difference 'Category.count' do
    post categories_path, params: { category: { name: " "}}
  
  end
  #assert_match "errors", response.body
  assert_select 'div.alert'
  assert_select 'h4.alert-heading'
 end
end
