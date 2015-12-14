class TwitchController < ApplicationController

	require 'date'

	def index



	end

	def notes
		@current_user = User.find(session[:user_id])
		@swap = User.find(1)
		@match_history_icon = []
		@swap.matches.each do |match|
			my_hash = {
			hero: match['hero_id']
			# slot: match['player_slot']
			}
			tempmatch = Match.find(match['match_id'])
			winner =  tempmatch['radiant_win']
			my_hash[:unformat_time] = tempmatch['start_time']
			my_hash[:time] = Time.at(tempmatch['start_time']).strftime("%F %I:%M %p")
			@match_history_icon.push(my_hash)
		end
		# @recent_matches = HTTParty.get("https://api.steampowered.com/IDOTA2Match_570/GetMatchHistory/V001/?key=73626CB2E22E10D9F4AB0D7ECBAF600B&account_id="+ @current_user.steam_id)

	  respond_to do |format|
        format.html
        format.json {render json: @match_history_icon}
      end
	end

	def editor

		@twitch_vid_list = HTTParty.get("https://api.twitch.tv/kraken/channels/lqt1/videos?broadcasts=true")
		
	end

	def logged

		@farm = (params[:code])

		@first_vid = "http://www.twitch.tv/lqt1/v/27732847"
		@second_vid = "http://www.twitch.tv/lqt1/v/27727234"
		@third_vid = "http://www.twitch.tv/lqt1/v/27717222"
		@fourth_vid = "http://www.twitch.tv/lqt1/b/682669810"
		@fifth_vid = "http://www.twitch.tv/lqt1/v/27812195"
		@sixth_vid = "http://www.twitch.tv/revel2k9/v/27683916"
		@seventh_vid = "http://www.twitch.tv/lqt1/v/28418815"
		@eight_vid = "http://www.twitch.tv/revel2k9/v/28401075"

		
		@url = @eight_vid.split("/")[-1]

		@timestamps_28401075 = [{start_time: "00:14:20" , end_time: "00:15:20"},
			{start_time: "00:17:00" , end_time: "00:17:10"},
			{start_time: "00:17:40" , end_time: "00:18:20"},
			{start_time: "00:20:30" , end_time: "00:20:40"},
			{start_time: "00:21:50" , end_time: "00:22:40"}]

		@timestamps_28418815 = [{start_time: "00:20:04" , end_time: "00:20:28"},
			{start_time: "00:29:40" , end_time: "00:30:10"},
			{start_time: "00:48:00" , end_time: "00:49:40"}]

		
		@timestamps_27812195 = [
			{start_time: "00:05:40" , end_time: "00:06:00"},
			{start_time: "00:08:20" , end_time: "00:09:00"},
			{start_time: "00:14:20" , end_time: "00:14:50"},
			{start_time: "00:20:40" , end_time: "00:21:00"},
			{start_time: "00:24:30" , end_time: "00:24:56"},
			{start_time: "00:26:40" , end_time: "00:27:10"},
			{start_time: "00:32:40" , end_time: "00:33:30"},
			{start_time: "00:35:30" , end_time: "00:36:00"},
			{start_time: "00:38:20" , end_time: "00:38:40"},
			{start_time: "00:44:50" , end_time: "00:45:15"},
			{start_time: "00:50:20" , end_time: "00:50:50"},
			{start_time: "00:53:20" , end_time: "00:54:40"},
			{start_time: "00:56:30" , end_time: "00:57:07"},
			{start_time: "00:59:10" , end_time: "01:00:00"},
			{start_time: "01:03:00" , end_time: "01:03:30"},
			{start_time: "01:09:20" , end_time: "01:10:04"},
			{start_time: "01:13:30" , end_time: "01:14:04"},
			{start_time: "01:14:30" , end_time: "01:16:10"},
			{start_time: "01:19:30" , end_time: "01:20:30"},
			{start_time: "01:26:50" , end_time: "01:28:00"}]

		@timestamps = [
	{start_time: "01:30:30" , end_time: "01:30:50"},
	{start_time: "01:35:20" , end_time: "01:35:40"},
	{start_time: "01:35:50" , end_time: "01:36:20"},
	{start_time: "01:38:30" , end_time: "01:38:50"},
	{start_time: "01:42:00" , end_time: "01:42:20"},
	{start_time: "01:44:30" , end_time: "01:45:10"},
	{start_time: "01:46:40" , end_time: "01:47:50"},
	{start_time: "01:52:00" , end_time: "01:52:40"},
	{start_time: "01:54:00" , end_time: "01:54:20"},
	{start_time: "02:01:00" , end_time: "02:02:10"},
	{start_time: "02:03:00" , end_time: "02:03:40"},
	{start_time: "02:04:10" , end_time: "02:04:40"},
	{start_time: "02:12:30" , end_time: "02:14:00"}]

	@timestamps_27683916  = [{start_time: "00:24:00" , end_time: "00:24:50"},
	{start_time: "00:33:00" , end_time: "00:33:40"},
	{start_time: "00:42:00" , end_time: "00:42:44"},
	{start_time: "00:44:56" , end_time: "00:45:25"},
	{start_time: "00:47:30" , end_time: "00:48:00"}]



	@timestamps_28401075.each do |clip|

		split_time = clip[:start_time].split(":")
		total = ((split_time[0].to_i)*3600)+((split_time[1].to_i)*60)+(split_time[2].to_i)
		# puts total
		# puts "-----"
		# puts (total/4).floor
		clip[:start_time] = (total/4).floor


		split_end_time = clip[:end_time].split(":")
		end_total = ((split_end_time[0].to_i)*3600)+((split_end_time[1].to_i)*60)+(split_end_time[2].to_i)
		
		clip[:end_time] = (end_total/4).floor

	end



		@twitchoauth = HTTParty.post("https://api.twitch.tv/kraken/oauth2/token" ,
			:query => { :client_id => "9n260py2zhrn2hmfol9a62cfuguuhs4" ,
				:client_secret => "kqxdgcamsetrudw3dpspb0d3otm8n3a",
				:grant_type => "authorization_code",
				:redirect_uri => "http://localhost:3000/twitch/logged",
				:code => (params[:code]),
			})

		
		@twitchsig = HTTParty.get("https://api.twitch.tv/api/vods/" + @url + "/access_token?as3=" + @twitchoauth['access_token'])	
		
		
		@twitch_q_playlist = HTTParty.get("http://usher.justin.tv/vod/" + @url + "?nauthsig=" + @twitchsig['sig']  + "&nauth=" + @twitchsig['token'])
		@dl_url = @twitch_q_playlist.split("\n").select{|l| l.start_with? "http"}[0]
		@prefix =  @dl_url.slice(0..(@dl_url.index('/index'))) 


		@twitch_e_playlist = HTTParty.get(@dl_url)

		# @first_part = @twitch_e_playlist.split("\n").select{|l| l.start_with? "index"}[(@timestamps_27812195[0][:start_time].to_i)..(@timestamps_27812195[0][:end_time].to_i)]
		# @second_part = @twitch_e_playlist.split("\n").select{|l| l.start_with? "index"}[(@timestamps_27812195[1][:start_time].to_i)..(@timestamps_27812195[1][:end_time].to_i)]
		# @third_part = @twitch_e_playlist.split("\n").select{|l| l.start_with? "index"}[(@timestamps_27812195[2][:start_time].to_i)..(@timestamps_27812195[2][:end_time].to_i)]
		@finalarr = []

		@timestamps_28401075.each_with_index do |timestamp , index|

			@temp_time =  @twitch_e_playlist.split("\n").select{|l| l.start_with? "index"}[(timestamp[:start_time].to_i)..(timestamp[:end_time].to_i)]
			@finalarr.push(@temp_time)
			@finalarr.flatten!
		end

		# open("28401075_final.ts", "wb") do |file|
			
		# 	@finalarr.each_with_index do |part,index|
		# 		@dl_url_test = @prefix + part
		# 		puts "downloading #{index} / #{@finalarr.length}"					
  # 				resp = RestClient.get(@dl_url_test)
  # 				file.write(resp.body)
		# 	end
		# end

		## to save the file on the users computer , use send_file
		# @data = "Hello World!"
		# @file = "my_file.txt"
		# File.open(@file, "w"){ |f| f << @data }
		# send_file(@file )

		# binding.pry

		# system "ffmpeg -i 'concat:slark_timestamps_1.ts|slark_timestamps_2.ts|slark_timestamps_3.ts|slark_timestamps_4.ts|slark_timestamps_5.ts|slark_timestamps_6.ts|slark_timestamps_7.ts|slark_timestamps_8.ts|slark_timestamps_9.ts|slark_timestamps_10.ts|slark_timestamps_11.ts|slark_timestamps_12.ts|slark_timestamps_13.ts|slark_timestamps_14.ts' -codec copy output_final.ts"
		# this code worked
		# system "ffmpeg -i 28401075_final.ts -preset veryfast -b:v 1200k -maxrate 1200k -bufsize 2400k -b:a 128k 28401075_final_2.mp4"

		# @finalarr.flatten!

		

		# @dl_url_dl =  @prefix + @first_part[0]
		# # @dl_url_dl = @dl_url.sub("index-dvr.m3u8","") + @first_part
		# puts @dl_url_dl
		# binding.pry
		# system "ffmpeg -y -f concat -i mylist.txt -c copy test2.ts"
		

		# open("slark_timestamps_1.ts", "wb") do |file|
  			
		# 	@first_part.each do |part|
		# 		@dl_url_test = @prefix + part
  #     			resp = RestClient.get(@dl_url_test)

  #     			file.write(resp.body)
		# 	end

  # 		end

  # 		open("slark_timestamps_2.ts", "wb") do |file|
  			
		# 	@second_part.each do |part|
		# 		@dl_url_test = @prefix + part
  #     			resp = RestClient.get(@dl_url_test)

  #     			file.write(resp.body)
		# 	end

  # 		end

  # 		open("slark_timestamps_3.ts", "wb") do |file|
  			
		# 	@third_part.each do |part|
		# 		@dl_url_test = @prefix + part
  #     			resp = RestClient.get(@dl_url_test)

  #     			file.write(resp.body)
		# 	end

  # 		end



	end


end


	# @url="27801902"
	# "#EXTM3U
	# #EXT-X-VERSION:3
	# #EXT-X-TARGETDURATION:4
	# #ID3-EQUIV-TDTG:2015-11-26T17:23:13
	# #EXT-X-PLAYLIST-TYPE:EVENT

	# #EXT-X-TWITCH-ELAPSED-SECS:0.0
	# #EXT-X-TWITCH-TOTAL-SECS:3473.967
	# #EXTINF:4.000,
	# index-0000000029-h4lR-muted.ts?start_offset=0&end_offset=821559
	# #EXTINF:4.000,
	# index-0000000029-h4lR-muted.ts?start_offset=821560&end_offset=1703843
	# #EXTINF:4.000,
	# index-0000000029-h4lR-muted.ts?start_offset=1703844&end_offset=2520327





