# https://www.youtube.com/watch?v=jpHghQr3t3U
# http://sujee.net/rails-cronjobs/#viewSource
# https://github.com/javan/whenever
# http://guides.rubyonrails.org/command_line.html
# https://www.youtube.com/watch?v=RS1juns_Sj0
# Las guas que use.


every 2.minutes do 
	rake "-T"
end

every :wednesday, :at => "0am" do
	rake "db:seed"
	runner " u = User.all"
end

# con este comando creas los crontabs:
# whenever --update-crontab MedApp
# con este comando compruebas si se crearon:
# crontab -l
