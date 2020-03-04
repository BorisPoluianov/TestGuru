class TestsMailer < ApplicationMailer

  def completed_test(test_progress)
    @user = test_progress.user
    @test = test_progress.test

    mail to: @user.email, subject: "You just completed the TestGuru test!"
  end
end
