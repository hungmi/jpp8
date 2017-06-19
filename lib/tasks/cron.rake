namespace :cron do
  desc "Test cron job works or not"
  task :check_cron_job_works => :environment do
    puts "#{Time.now} Cron Job works *( ^ 3 ^ )*y "
  end

  desc "從台銀抓取日圓匯率"
  task update_jpy_currency: :environment do
  	JapanCurrencyJob.perform_later
  end
end