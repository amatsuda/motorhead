# frozen_string_literal: true
class HelloMailer < ActionMailer::Base
  def hello
    mail to: 'test@example.com', from: 'test@example.com', subject: 'hello'
  end
end
