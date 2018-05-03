desc 'send weekly email'

task send_weekly_email: :environment do
  Preference.find_each do |preference|
    @activities = Activity.approved
    @user = User.find_by(id: preference.used_id)
    UserMailer.weekly_email(preference.preference_id, @activities, @user).deliver
  end
end
