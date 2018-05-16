desc 'send weekly email'

#Task: For each preference find the user it belongs to and call the function to send the email
task send_weekly_email: :environment do
  Preference.find_each do |preference|
    #get all activities to pass them in the weekly_email function
    @activities = Activity.approved
    #find the user this preferences belong to 
    @user = User.find_by(id: preference.user_id)
    UserMailer.weekly_email(preference.preference_id, @activities, @user).deliver
  end
end
