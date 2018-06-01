set :environment, "development"
set :output, "#{path}/log/cron_log.log"

every 8.hours do
  rake "do:send_mail"
end
