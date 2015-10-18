class IssueMailer < ActionMailer::Base
  default from: ENV['MAIL_FROM']

  def notify_subscribers(issue:, subscriber:)
    @issue = issue
    @subscriber = subscriber

    mail to: @subscriber.email, subject: "[#{ENV['ISSUE_MAIL_SUBJECT']}] #{@issue.title}"
  end
end
