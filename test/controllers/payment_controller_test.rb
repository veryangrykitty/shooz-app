require "test_helper"

class PaymentControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get payment_create_url
    assert_response :success
  end
end
