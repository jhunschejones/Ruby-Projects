require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderMailer.received(orders(:one))
    assert_equal "Depot Books Order Confirmation", mail.subject
    assert_equal ["carl@dafox.com"], mail.to
    assert_equal ["joshua@hunschejones.com"], mail.from
    assert_match /1 x Programming Ruby 1.9/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderMailer.shipped(orders(:one))
    assert_equal "Depot Books Order Shipped", mail.subject
    assert_equal ["carl@dafox.com"], mail.to
    assert_equal ["joshua@hunschejones.com"], mail.from
    assert_match /<td[^>]*>1<\/td>\s*<td>Programming Ruby 1.9<\/td>/, mail.body.encoded
  end

end
