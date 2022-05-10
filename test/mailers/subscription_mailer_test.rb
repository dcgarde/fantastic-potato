require "test_helper"

class SubscriptionMailerTest < ActionMailer::TestCase
    def payment_failed
      SubscriptionMailer.with(user: User.first).payment_failed
    end

end
