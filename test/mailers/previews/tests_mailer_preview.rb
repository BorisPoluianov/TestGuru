# Preview all emails at http://localhost:3000/rails/mailers/tests_mailer
class TestsMailerPreview < ActionMailer::Preview

  def completed_test
    test_progress = TestProgress.new(user: User.first, test: Test.first)

    TestsMailer.completed_test(test_progress)
  end
end
