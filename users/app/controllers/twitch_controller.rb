class TwitchController < ApplicationController

	require 'date'
	require 'open-uri'

	def video

	end

	def index



	end

	def notes
		# @current_user = User.find(session[:user_id])
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
		@weaver_vid = "http://www.twitch.tv/lqt1/v/29875810"

		
		@url = @weaver_vid.split("/")[-1]

		@timestamps_29875810 = [{start_time: "00:24:56" , end_time: "00:25:05"},
			{start_time: "00:35:40" , end_time: "00:36:06"},
			{start_time: "00:43:10" , end_time: "00:43:40"},
			{start_time: "00:49:40" , end_time: "00:50:00"},
			{start_time: "01:02:30" , end_time: "01:03:30"},
			{start_time: "01:05:20" , end_time: "01:06:00"}]

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



	@timestamps_29875810.each do |clip|

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

		@timestamps_29875810.each_with_index do |timestamp , index|

			@temp_time =  @twitch_e_playlist.split("\n").select{|l| l.start_with? "index"}[(timestamp[:start_time].to_i)..(timestamp[:end_time].to_i)]
			@finalarr.push(@temp_time)
		end
		@finalarr.flatten!


		@finalarr.each_with_index do |part,index|
			@dl_url_test = @prefix + part

			# Make an object in your bucket for your upload
	    obj = S3_BUCKET.objects["user1/" + index.to_s + ".ts"]
	    resp = RestClient.get(@dl_url_test)

	    # Upload the file
	    obj.write(resp.body, acl: :public_read)

	  end

		# @finalarr.each_with_index do |part,index|
		# 	@dl_url_test = @prefix + part
		# 	open(index.to_s + ".ts","wb") do |file|
		# 		  resp = RestClient.get(@dl_url_test)
  # 				file.write(resp.body)
		# 	end
		# end



		binding.pry

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


 # "#EXTM3U
 # #EXT-X-TWITCH-INFO:CLUSTER=\"akamai_vod\",REGION=\"NA-EAST\",MANIFEST-CLUSTER=\"akamai_vod\",USER-IP=\"173.52.217.66\"
 # #EXT-X-MEDIA:TYPE=VIDEO,GROUP-ID=\"chunked\",NAME=\"Source\",AUTOSELECT=YES,DEFAULT=YES
 # #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1684339,CODECS=\"avc1.4D4029,mp4a.40.2\",RESOLUTION=\"1280x720\",VIDEO=\"chunked\"
 # http://vod.ak.hls.ttvnw.net/v1/AUTH_system/vods_c67b/lqt1_18226245184_363840873/chunked/index-muted-OB5LDZ5SQP.m3u8\n"



#EXTM3U
#EXT-X-VERSION:3
#EXT-X-TARGETDURATION:4
#ID3-EQUIV-TDTG:2015-12-14T05:56:44
#EXT-X-PLAYLIST-TYPE:EVENT

#EXT-X-TWITCH-ELAPSED-SECS:0.0
#EXT-X-TWITCH-TOTAL-SECS:4119.9
#EXTINF:4.000,
#index-0000000029-DbkV.ts?start_offset=0&end_offset=842991


# "index-0000000389-EtVO.ts?start_offset=11791924&end_offset=12626267",
#  "index-0000000389-EtVO.ts?start_offset=12626268&end_offset=13468695",
#  "index-0000000389-EtVO.ts?start_offset=13468696&end_offset=14310183",
#  "index-0000000539-xmDd.ts?start_offset=21061640&end_offset=21917415",
#  "index-0000000539-xmDd.ts?start_offset=21917416&end_offset=22735967",
#  "index-0000000539-xmDd.ts?start_offset=22735968&end_offset=23598135",
#  "index-0000000539-xmDd.ts?start_offset=23598136&end_offset=24421199",
#  "index-0000000539-xmDd.ts?start_offset=24421200&end_offset=25279043",
#  "index-0000000569-ihRx.ts?start_offset=0&end_offset=873635",
#  "index-0000000569-ihRx.ts?start_offset=873636&end_offset=1667747",
#  "index-0000000659-JN4U.ts?start_offset=14313756&end_offset=15176111",
#  "index-0000000659-JN4U.ts?start_offset=15176112&end_offset=16043731",
#  "index-0000000659-JN4U.ts?start_offset=16043732&end_offset=16851003",
#  "index-0000000659-JN4U.ts?start_offset=16851004&end_offset=17683655",
#  "index-0000000659-JN4U.ts?start_offset=17683656&end_offset=18559735",
#  "index-0000000659-JN4U.ts?start_offset=18559736&end_offset=19383739",
#  "index-0000000659-JN4U.ts?start_offset=19383740&end_offset=20208683",
#  "index-0000000659-JN4U.ts?start_offset=20208684&end_offset=21049795",
#  "index-0000000659-JN4U.ts?start_offset=21049796&end_offset=21919295",
#  "index-0000000749-O1aM.ts?start_offset=21059008&end_offset=21880003",
#  "index-0000000749-O1aM.ts?start_offset=21880004&end_offset=22777327",
#  "index-0000000749-O1aM.ts?start_offset=22777328&end_offset=23564483",
#  "index-0000000749-O1aM.ts?start_offset=23564484&end_offset=24439247",
#  "index-0000000749-O1aM.ts?start_offset=24439248&end_offset=25248775",
#  "index-0000000779-BrfG-muted.ts?start_offset=0&end_offset=868747",
#  "index-0000000959-6GxI-muted.ts?start_offset=5783256&end_offset=6589023",
#  "index-0000000959-6GxI-muted.ts?start_offset=6589024&end_offset=7214687",
#  "index-0000000959-6GxI-muted.ts?start_offset=7214688&end_offset=7906151",
#  "index-0000000959-6GxI-muted.ts?start_offset=7906152&end_offset=8771703",
#  "index-0000000959-6GxI-muted.ts?start_offset=7214688&end_offset=7906151",
#  "index-0000000959-6GxI-muted.ts?start_offset=7906152&end_offset=8771703",
#  "index-0000000959-6GxI-muted.ts?start_offset=8771704&end_offset=9579915",
#  "index-0000000959-6GxI-muted.ts?start_offset=9579916&end_offset=10403167",
#  "index-0000000959-6GxI-muted.ts?start_offset=10403168&end_offset=11280375",
#  "index-0000000959-6GxI-muted.ts?start_offset=11280376&end_offset=12088211",
#  "index-0000000959-6GxI-muted.ts?start_offset=12088212&end_offset=12936279",
#  "index-0000000959-6GxI-muted.ts?start_offset=12936280&end_offset=13760283",
#  "index-0000000959-6GxI-muted.ts?start_offset=13760284&end_offset=14632603",
#  "index-0000000959-6GxI-muted.ts?start_offset=14632604&end_offset=15447019",
#  "index-0000000959-6GxI-muted.ts?start_offset=15447020&end_offset=16283995",
#  "index-0000000959-6GxI-muted.ts?start_offset=16283996&end_offset=17127363",
#  "index-0000000959-6GxI-muted.ts?start_offset=17127364&end_offset=17963963",
#  "index-0000000959-6GxI-muted.ts?start_offset=17963964&end_offset=18805639",
#  "index-0000000989-wn54.ts?start_offset=16759260&end_offset=17602627",
#  "index-0000000989-wn54.ts?start_offset=17602628&end_offset=18467615",
#  "index-0000000989-wn54.ts?start_offset=18467616&end_offset=19314179",
#  "index-0000000989-wn54.ts?start_offset=19314180&end_offset=20129535",
#  "index-0000000989-wn54.ts?start_offset=20129536&end_offset=20994711",
#  "index-0000000989-wn54.ts?start_offset=20994712&end_offset=21812699",
#  "index-0000000989-wn54.ts?start_offset=21812700&end_offset=22654563",
#  "index-0000000989-wn54.ts?start_offset=22654564&end_offset=23513911",
#  "index-0000000989-wn54.ts?start_offset=23513912&end_offset=24338667",
#  "index-0000000989-wn54.ts?start_offset=24338668&end_offset=25205723",
#  "index-0000001019-m6XL.ts?start_offset=0&end_offset=836975"]

