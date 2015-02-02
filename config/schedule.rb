# https://www.youtube.com/watch?v=jpHghQr3t3U
# http://sujee.net/rails-cronjobs/#viewSource
# https://github.com/javan/whenever
# http://guides.rubyonrails.org/command_line.html
# https://www.youtube.com/watch?v=RS1juns_Sj0
# Las guas que use.

set :environment, "development"
set :output, "#{path}/log/whenever.log"

# every 2.minutes do 
# 	rake "-T"
# end

# every :wednesday, :at => "0am" do
# 	rake "db:seed"
# 	runner " u = User.all"
# end


every 1.minutes do
	rake "check"
end
# con este comando creas los crontabs:
# whenever --update-crontab MedApp
# con este comando compruebas si se crearon:
# crontab -l
#con este puedes editar los crontabs
# crontab -e
#despues de haerlo todo corre:
# pgrep cron
# sudo service cron restart
