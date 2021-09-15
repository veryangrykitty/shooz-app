require "test_helper"

class ShippingdetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get shippingdetails_create_url
    assert_response :success
  end
end
