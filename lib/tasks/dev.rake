namespace :dev do
  desc "backup db"
  task :backup => [:environment] do |t, args|
    db_name = Rails.application.config.database_configuration[Rails.env]["database"]
    now = Time.current.strftime('%Y%m%d%H%M%S')
    puts "#{now}開始備份完整資料庫..."
    if Rails.env.production?
      @file_name = "jpp8_pro_#{now}.dump"
      @local_dir = "/home/deploy/apps/db_backups"
      # 記得要去 /home/deploy 創一個 .pgpass 然後 sudo chmod 600 /home/deploy/.pgpass
      `PGPASSFILE=~/.pgpass pg_dump -Fc --no-acl --no-owner -h localhost -U #{ENV['PG_USERNAME']} #{ENV['PG_PASSWORD']} > "#{@local_dir}/#{@file_name}"`
      puts "開始上傳..."
      @fog = UploadService.fog
      @dir = @fog.directories.get("jpp8-db-backups")
      # Rake::Task["dev:upload"].invoke()
      file = @dir.files.create ({
        :key    => @file_name,
        :body   => File.open("#{@local_dir}/#{@file_name}"),
        :public => false
      })
      puts "上傳成功" #，link: #{file.public_url}"
    else
      @file_name = "jpp8_dev_#{now}.dump"
      @local_dir = "/Users/hungmi/Documents/jpp8_aws"
      `pg_dump -Fc --no-acl --no-owner -h localhost -U hungmi #{db_name} > "#{@local_dir}/#{@file_name}"`
      puts "備份完成"
    end
  end
end