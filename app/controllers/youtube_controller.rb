class YoutubeController < ApplicationController
    require 'google/apis/youtube_v3'
  
    def find_videos(keyword, after: 1.months.ago, before: Time.now)
     service = Google::Apis::YoutubeV3::YouTubeService.new
     service.key = ENV['YOUTUBE_DATA_API_KEY']
  
     next_page_token = nil
     opt = {
       q: keyword,
       type: 'video',
       max_results: 2,
       order: :date,
       page_token: next_page_token,
       published_after: after.iso8601,
       published_before: before.iso8601
     }
     service.list_searches(:snippet, opt)
    end
  
    def index
      @youtube_data = find_videos('焼まゆるのお絵かきちゃんねる')
      @post = Post.new
    end
  
  
    def indexx
      !params[:keyword].blank?
      require 'google/apis/youtube_v3'
      youtube = Google::Apis::YoutubeV3::YouTubeService.new
      youtube.key = ENV['YOUTUBE_DATA_API_KEY']
      youtube_search_list = youtube.list_searches("id,snippet", type: "video",
                                                              q: params[:keyword],
                                                              max_results: 5)
      search_result = youtube_search_list.to_h
      @movies = search_result[:items]
  
      end
  
    end