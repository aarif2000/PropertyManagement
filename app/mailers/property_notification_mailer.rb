class PropertyNotificationMailer < ApplicationMailer

  
  def create_notification(object)
  @object= object 
  @object_count = object.class.count 
  mail to: User.last.email, subject: "A new entry for #{object.class} has been created "
  end

 

  
  def delete_notification(object)
    @object= object 
    @object_count = object.class.count 
    mail to: User.last.email, subject: "A new entry for #{object.class} has been deleted "

  end

  def booking_notification(object)
    @object= object 
    # @object_count = object.class.count 
    mail to: User.last.email, subject: "You have successfully booked #{object.class}"

  end

  def bill_notification(object)
    @object= object 
    mail to: User.last.email, subject: "You have Receive a bill  #{object.class}"
  end
end
