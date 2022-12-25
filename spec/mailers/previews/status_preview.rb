# Preview all emails at http://localhost:3000/rails/mailers/status
class StatusPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/status/congratulation
  def congratulation
    StatusMailer.congratulation
  end

end
