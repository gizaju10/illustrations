class YoutubeController < ApplicationController
  before_action :authenticate_user!

  def search
    require 'google/apis/youtube_v3'
    youtube = Google::Apis::YoutubeV3::YouTubeService.new

    # flash[:alert] = "1"〜"10"は開発環境時に適宜使用
    begin
      youtube.key = ENV['YOUTUBE_1']
      youtube_search_list = youtube.list_searches('id,snippet', type: 'video', q: params[:keyword], max_results: 10)
      # flash[:alert] = "1"
    rescue Google::Apis::ClientError
      begin
        youtube.key = ENV['YOUTUBE_2']
        youtube_search_list = youtube.list_searches('id,snippet', type: 'video', q: params[:keyword], max_results: 10)
        # flash[:alert] = "2"
      rescue Google::Apis::ClientError
        begin
          youtube.key = ENV['YOUTUBE_3']
          youtube_search_list = youtube.list_searches('id,snippet', type: 'video', q: params[:keyword],
                                                                    max_results: 10)
          # flash[:alert] = "3"
        rescue Google::Apis::ClientError
          begin
            youtube.key = ENV['YOUTUBE_4']
            youtube_search_list = youtube.list_searches('id,snippet', type: 'video', q: params[:keyword],
                                                                      max_results: 10)
            # flash[:alert] = "4"
          rescue Google::Apis::ClientError
            begin
              youtube.key = ENV['YOUTUBE_5']
              youtube_search_list = youtube.list_searches('id,snippet', type: 'video', q: params[:keyword],
                                                                        max_results: 10)
              # flash[:alert] = "5"
            rescue Google::Apis::ClientError
              begin
                youtube.key = ENV['YOUTUBE_6']
                youtube_search_list = youtube.list_searches('id,snippet', type: 'video', q: params[:keyword],
                                                                          max_results: 10)
                # flash[:alert] = "6"
              rescue Google::Apis::ClientError
                begin
                  youtube.key = ENV['YOUTUBE_7']
                  youtube_search_list = youtube.list_searches('id,snippet', type: 'video', q: params[:keyword],
                                                                            max_results: 10)
                  # flash[:alert] = "7"
                rescue Google::Apis::ClientError
                  begin
                    youtube.key = ENV['YOUTUBE_8']
                    youtube_search_list = youtube.list_searches('id,snippet', type: 'video', q: params[:keyword],
                                                                              max_results: 10)
                    # flash[:alert] = "8"
                  rescue Google::Apis::ClientError
                    begin
                      youtube.key = ENV['YOUTUBE_9']
                      youtube_search_list = youtube.list_searches('id,snippet', type: 'video', q: params[:keyword],
                                                                                max_results: 10)
                      # flash[:alert] = "9"
                    rescue Google::Apis::ClientError
                      begin
                        youtube.key = ENV['YOUTUBE_10']
                        youtube_search_list = youtube.list_searches('id,snippet', type: 'video', q: params[:keyword],
                                                                                  max_results: 10)
                        # flash[:alert] = "10"
                      rescue Google::Apis::ClientError
                        flash[:alert] = '１日の上限に達しました。新規投稿の際は、https://www.youtube.com から動画を検索してご利用下さい。'
                        redirect_to(posts_path)
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end

    search_result = youtube_search_list.to_h
    @movies = search_result[:items]
    @post = Post.new
  end
end
