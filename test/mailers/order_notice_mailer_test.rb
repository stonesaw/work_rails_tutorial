require "test_helper"

class OrderNoticeMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNoticeMailer.received(orders(:one))
    assert_equal "Pragmatic Store Order Confirmation", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /1 x Programming Ruby 3.0/, mail.text_part.body.to_s
  end

  test "shipped" do
    mail = OrderNoticeMailer.shipped(orders(:one))
    assert_equal "Pragmatic Store Order Shipped", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /<td>1&times;<\/td>\s*<td>Programming Ruby 3.0<\/td>/, mail.html_part.body.to_s
  end
end


