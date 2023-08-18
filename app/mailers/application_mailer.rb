# frozen_string_literal: true

# Classe base para os mailers da aplicação.
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
