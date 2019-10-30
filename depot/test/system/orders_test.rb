require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  include ActiveJob::TestHelper

  test "check routing number" do
    LineItem.delete_all
    Order.delete_all

    visit store_index_url

    first('.catalog li').click_on 'Add to Cart'

    click_on 'Checkout'

    fill_in 'order_name', with: 'Josh Jones'
    fill_in 'order_address', with: '111 SW 5th Ave'
    fill_in 'order_email', with: 'joshua@hunschejones.com'

    assert_no_selector "#order_routing_number"
    select 'Check', from: 'pay_type'
    assert_selector "#order_routing_number"

    fill_in "Routing #", with: "123456"
    fill_in "Account #", with: "9101112"

    # execute the background job instead of waiting for assertion
    perform_enqueued_jobs do
      click_button "Place Order"
    end

    orders = Order.all
    assert_equal 1, orders.size

    order = orders.first

    assert_equal "Josh Jones", order.name
    assert_equal "111 SW 5th Ave", order.address
    assert_equal "joshua@hunschejones.com", order.email
    assert_equal "Check", order.pay_type
    assert_equal 1, order.line_items.size

    mail = ActionMailer::Base.deliveries.last
    assert_equal ["joshua@hunschejones.com"], mail.to
    assert_equal 'Josh Jones <joshua@hunschejones.com>', mail[:from].value
    assert_equal "Depot Books Order Confirmation", mail.subject
  end
end
