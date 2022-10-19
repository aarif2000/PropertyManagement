# Preview all emails at http://localhost:3000/rails/mailers/property_notification_mailer
class PropertyNotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/property_notification_mailer/create_notification
  def create_notification
    PropertyNotificationMailer.create_notification
  end

  # Preview this email at http://localhost:3000/rails/mailers/property_notification_mailer/update_notification
  def update_notification
    PropertyNotificationMailer.update_notification
  end

  # Preview this email at http://localhost:3000/rails/mailers/property_notification_mailer/delete_notification
  def delete_notification
    PropertyNotificationMailer.delete_notification
  end

end
