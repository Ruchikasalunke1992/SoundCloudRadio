class SongsController < ApplicationController
  before_filter :set_current_user

  def search_by_genre
    if (params[:search_term] == nil) || (params[:search_term].blank? == true)
      flash[:notice] = "Invalid search term"
      redirect_to sessions_path
    else
      @searched_term = params[:search_term]
      client = SoundCloud.new(:client_id => 'd2e2927d267c9beb15ad51ad98e897c6')
      @songs_info = []
      tracks = client.get('/tracks', :limit => 30,:genres => @searched_term, :order => 'created_at', :offset => 30)
      tracks.each do |track|
        if track.stream_url
          songs_hash = {}
          songs_hash[:track] = track
          songs_hash[:title] = track.title
          songs_hash[:username] = track.user.username
          songs_hash[:url] = track.permalink_url
          songs_hash[:stream_url] = track.stream_url + '?client_id=d2e2927d267c9beb15ad51ad98e897c6'
          @songs_info.push(songs_hash)
        end
      end

      if tracks.count == 0
	      flash[:notice] = "No matching songs were found on Soundcloud"
        redirect_to sessions_path
      end
    end
  end
end
