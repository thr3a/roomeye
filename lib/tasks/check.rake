namespace :check do
  desc "TODO"
  task add: :environment do
    require 'open-uri'
    begin
      res = OpenURI.open_uri('http://192.168.1.205:4567/', :read_timeout => 3)
    rescue => e
      # 例外処理 ex.タイムアウトとか
      Rails.logger.error("#{e.class} : #{e.message}")
    else
      code, message = res.status # res.status => ["200", "OK"]
      if code == '200'
        data = JSON.parse res.read
        Condition.create(
          temp: data["temp"],
          humid: data["humid"],
          hpa: data["hpa"]
        )
      else
        Rails.logger.error("#{code} #{message}")
      end
    end
  end
end
* * * * * /bin/bash -lc '/Users/thr3a/rails/roomeye/lib/tasks/check.rake'
