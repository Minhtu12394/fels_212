class SendStatisticToUserWorker
  include Sidekiq::Worker

  def perform
    User.all.each do |user|
      LessonCreateMailer.send_statistic_to_user(user).deliver
    end
  end
end
