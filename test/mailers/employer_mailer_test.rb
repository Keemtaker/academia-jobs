require 'test_helper'

class EmployerMailerTest < ActionMailer::TestCase
  test "job_post_confirmation" do
    mail = EmployerMailer.job_post_confirmation
    assert_equal "Job post confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
