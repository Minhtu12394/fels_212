namespace :do do
  desc "send_statistic"
  task send_mail: :environment do
    SendStatisticToUserWorker.perform_async()
  end
end
