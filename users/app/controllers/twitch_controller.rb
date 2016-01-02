class TwitchController < ApplicationController

	require 'date'
	require 'open-uri'
	require 'm3u8'
	require 'tempfile'

	# http://d10bybrdwoa4y6.cloudfront.net/user1/match/4/notes/am_0.ts

	def video

		vid_urls = Note.select('vid_url').where(match_id: 5)
		# @test_urls = Hash[vid_urls.pluck(:vid_url)]
		playlist = M3u8::Playlist.new
		options = { version: 3, target: 4, playlist_type: 'event' }
		playlist = M3u8::Playlist.new(options)
		cloudpath = 'http://d10bybrdwoa4y6.cloudfront.net/'

		vid_urls.each do |paths|
			paths['vid_url'].each do |url|
				item = M3u8::SegmentItem.new(duration: 4.0, segment: cloudpath + url)
				playlist.items << item
			end	
			item = M3u8::DiscontinuityItem.new
			playlist.items << item
		end

		# open("test3.m3u8", "wb") do |file|
  # 		file.write(playlist)
		# end
		# file = Tempfile.new(['test2','.m3u8'])
		# playlist.write(file)
		# file.close
		# @playlist_path = file.path
		# binding.pry
		


	end

	def index



	end

	def editform
		binding.pry

	end

	def notes
		# @current_user = User.find(session[:user_id])
		user = User.find(session[:user_id])
		@match_history_icon = []
		user.matches.each do |match|
			player = user.players.find_by(match_id: match.id)		
			my_hash = {
			hero: player.hero_id
			# slot: match['player_slot']
			}
			# binding.pry
			# tempmatch = Match.find(match['match_id'])
			winner =  match['radiant_win']
			slot = player['player_slot']
			if (match['radiant_win'] == true) && (slot == 0 || slot == 1 || slot == 2 || slot == 3 || slot == 4)
				win = true
			else
				win = false
			end
			my_hash[:win] = win
			my_hash[:unformat_time] = match['start_time']
			my_hash[:time] = Time.at(match['start_time']).strftime("%F %I:%M %p")
			@match_history_icon.push(my_hash)
		end
		# @recent_matches = HTTParty.get("https://api.steampowered.com/IDOTA2Match_570/GetMatchHistory/V001/?key=73626CB2E22E10D9F4AB0D7ECBAF600B&account_id="+ @current_user.steam_id)

	  respond_to do |format|
        format.html
        format.json {render json: @match_history_icon}
      end
	end

	def editor

		@twitch_vid_list = HTTParty.get("https://api.twitch.tv/kraken/channels/lqt1/videos?broadcasts=true&limit=50")
		@twitch_token = session[:twitch_acess_token]
		binding.pry
	end

	def logged



		@twitchoauth = HTTParty.post("https://api.twitch.tv/kraken/oauth2/token" ,
			:query => { :client_id => "9n260py2zhrn2hmfol9a62cfuguuhs4" ,
				:client_secret => Rails.application.secrets.twitch_api_key,
				:grant_type => "authorization_code",
				:redirect_uri => "http://localhost:3000/twitch/logged",
				:code => (params[:code]),
		})

		binding.pry
		# @farm = (params[:code])
		twitch_video_url = JSON.parse(params[:twitch_url])
		note_match_id = params[:match_id]
		note_obj = JSON.parse(params[:obj])
		@url =  twitch_video_url['value'].sub('v','')


		note_obj.each do |note|

			split_time = note['start_time'].split(":")
			total = ((split_time[0].to_i)*3600)+((split_time[1].to_i)*60)+(split_time[2].to_i)
			note['start_time'] = (total/4).floor
			split_end_time = note['end_time'].split(":")
			end_total = ((split_end_time[0].to_i)*3600)+((split_end_time[1].to_i)*60)+(split_end_time[2].to_i)
			note['end_time'] = (end_total/4).floor

		end

		@twitchsig = HTTParty.get("https://api.twitch.tv/api/vods/" + @url + "/access_token?as3=" + @twitchoauth['access_token'])	
		session[:twitch_acess_token] = @twitchoauth['access_token']
		
		@twitch_q_playlist = HTTParty.get("http://usher.justin.tv/vod/" + @url + "?nauthsig=" + @twitchsig['sig']  + "&nauth=" + @twitchsig['token'])
		@dl_url = @twitch_q_playlist.split("\n").select{|l| l.start_with? "http"}[0]
		@prefix =  @dl_url.slice(0..(@dl_url.index('/index'))) 


		@twitch_e_playlist = HTTParty.get(@dl_url)

		# @first_part = @twitch_e_playlist.split("\n").select{|l| l.start_with? "index"}[(@timestamps_27812195[0][:start_time].to_i)..(@timestamps_27812195[0][:end_time].to_i)]
		# @second_part = @twitch_e_playlist.split("\n").select{|l| l.start_with? "index"}[(@timestamps_27812195[1][:start_time].to_i)..(@timestamps_27812195[1][:end_time].to_i)]
		# @third_part = @twitch_e_playlist.split("\n").select{|l| l.start_with? "index"}[(@timestamps_27812195[2][:start_time].to_i)..(@timestamps_27812195[2][:end_time].to_i)]
		@finalarr = []
		@finalarr2 = []

		note_obj.each do |note|
			@temp_time =  @twitch_e_playlist.split("\n").select{|l| l.start_with? "index"}[(note['start_time'].to_i)..(note['end_time'].to_i)]
			@finalarr2.push(@temp_time)
		end

		# @timestamps_28869354.each_with_index do |timestamp , index|

		# 	@temp_time =  @twitch_e_playlist.split("\n").select{|l| l.start_with? "index"}[(timestamp[:start_time].to_i)..(timestamp[:end_time].to_i)]
		# 	@finalarr.push(@temp_time)
		# end

		@finalarr.each do |array|
			array.each do |urls|
				puts urls
			end
		end

		@finalarr.flatten!


		@finalarr2.each_with_index do |part,index|
			temparr = []
			part.each_with_index do |note, nindex|
				@dl_url_test = @prefix + note
				# Make an object in your bucket for your upload
				filename = "user1/match/" + note_match_id + "/notes/clip_" + index.to_s + "/part" + nindex.to_s + ".ts"
	    	obj = S3_BUCKET.objects[filename]
	    	resp = RestClient.get(@dl_url_test)

	    	# Upload the file
	    	obj.write(resp.body, acl: :public_read)
				temparr.push(filename)
				end
			note_obj[index]['urls'] = temparr
	  end

	  note_obj.each do |note|
	  	x = note['player_notes'].split("\\n")
	  	Note.create(
	  		match_id: 5,
	  		start_time: note['start_time'],
				end_time: note['end_time'],
				category: note['category'],
				player_notes: x,
				vid_url: note['urls']
			) 
	  end
	  binding.pry

	end


end

