class YoutubeController < ApplicationController
  require 'google/apis/youtube_v3'

  def find_videos(keyword, after: 500.months.ago, before: Time.now)
  begin
   service = Google::Apis::YoutubeV3::YouTubeService.new
   service.key = ENV['YOUTUBE_3']

   next_page_token = nil
   opt = {
     q: keyword,
     type: 'video',
     max_results: 99999999,
     order: :date,
     page_token: next_page_token,
     published_after: after.iso8601,
     published_before: before.iso8601
   }
   service.list_searches(:snippet, opt)
  rescue Google::Apis::ClientError
    flash[:alert] = "１日の上限に達しました。"
    redirect_to(root_path)
  end
  end

  def index
    @youtube_data = find_videos('c')
    @post = Post.new
  end

def indexx
  require 'google/apis/youtube_v3'
  youtube = Google::Apis::YoutubeV3::YouTubeService.new
          
  begin
    youtube.key = ENV['YOUTUBE_1']
    youtube_search_list = youtube.list_searches("id,snippet", type: "video", q: params[:keyword], max_results: 8)
    flash[:alert] = "1"
  rescue Google::Apis::ClientError
    begin
      youtube.key = ENV['YOUTUBE_2']
      youtube_search_list = youtube.list_searches("id,snippet", type: "video", q: params[:keyword], max_results: 8)
      flash[:alert] = "2"
    rescue Google::Apis::ClientError
      begin
        youtube.key = ENV['YOUTUBE_3']
        youtube_search_list = youtube.list_searches("id,snippet", type: "video", q: params[:keyword], max_results: 8)
        flash[:alert] = "3"
      rescue Google::Apis::ClientError
          begin
            youtube.key = ENV['YOUTUBE_4']
            youtube_search_list = youtube.list_searches("id,snippet", type: "video", q: params[:keyword], max_results: 8)
            flash[:alert] = "4"
          rescue Google::Apis::ClientError
            begin
              youtube.key = ENV['YOUTUBE_5']
              youtube_search_list = youtube.list_searches("id,snippet", type: "video", q: params[:keyword], max_results: 8)
              flash[:alert] = "5"
            rescue Google::Apis::ClientError
              begin
                youtube.key = ENV['YOUTUBE_6']
                youtube_search_list = youtube.list_searches("id,snippet", type: "video", q: params[:keyword], max_results: 8)
                flash[:alert] = "6"
              rescue Google::Apis::ClientError
                begin
                  youtube.key = ENV['YOUTUBE_7']
                  youtube_search_list = youtube.list_searches("id,snippet", type: "video", q: params[:keyword], max_results: 8)
                  flash[:alert] = "7"
                rescue Google::Apis::ClientError
                  begin
                    youtube.key = ENV['YOUTUBE_8']
                    youtube_search_list = youtube.list_searches("id,snippet", type: "video", q: params[:keyword], max_results: 8)
                    flash[:alert] = "8"
                  rescue Google::Apis::ClientError
                    begin
                      youtube.key = ENV['YOUTUBE_9']
                      youtube_search_list = youtube.list_searches("id,snippet", type: "video", q: params[:keyword], max_results: 8)
                      flash[:alert] = "9"
                    rescue Google::Apis::ClientError
                      begin
                        youtube.key = ENV['YOUTUBE_10']
                        youtube_search_list = youtube.list_searches("id,snippet", type: "video", q: params[:keyword], max_results: 8)
                        flash[:alert] = "10"
                      rescue Google::Apis::ClientError
                        flash[:alert] = "１日の上限に達しました。"
                        redirect_to(root_path)
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
  # flash[:alert] = "OK"    
end




















































# 一歩前
  # def indexx
  #   require 'google/apis/youtube_v3'
  #   youtube = Google::Apis::YoutubeV3::YouTubeService.new
    
  #   begin
  #     youtube.key = ENV['YOUTUBE_1']
  #     youtube_search_list = youtube.list_searches("id,snippet", type: "video", q: params[:keyword], max_results: 2)
  #   rescue Google::Apis::ClientError
  #     begin
  #     youtube.key = ENV['YOUTUBE_2']
  #     youtube_search_list = youtube.list_searches("id,snippet", type: "video", q: params[:keyword], max_results: 3)
  #   rescue Google::Apis::ClientError
  #     youtube.key = ENV['YOUTUBE_3']
  #     youtube_search_list = youtube.list_searches("id,snippet", type: "video", q: params[:keyword], max_results: 3)
  #   end

  #   search_result = youtube_search_list.to_h
  #   @movies = search_result[:items]
  #   @post = Post.new
      
  #   rescue Google::Apis::ClientError
  #     flash[:alert] = "１日の上限に達しました。"
  #     redirect_to(root_path)
  #   end

  # end








  # def indexx
  #   begin
  #   !params[:keyword].blank?
  #   require 'google/apis/youtube_v3'
  #   youtube = Google::Apis::YoutubeV3::YouTubeService.new
  #   youtube.key = ENV['YOUTUBE_']
  #   youtube_search_list = youtube.list_searches("id,snippet", type: "video", q: params[:keyword], max_results: 2)
  #   search_result = youtube_search_list.to_h
  #   @movies = search_result[:items]
  #   @post = Post.new

  #   rescue Google::Apis::ClientError
  #     youtube.key = ENV['YOUTUBE_']
  #     youtube_search_list = youtube.list_searches("id,snippet", type: "video", q: params[:keyword], max_results: 3)
  #     search_result = youtube_search_list.to_h
  #     @movies = search_result[:items]
  #     @post = Post.new
  #     # flash[:alert] = "１日の上限に達しました。"
  #     # redirect_to(root_path)
      
  #   rescue Google::Apis::ClientError
  #     flash[:alert] = "１日の上限に達しました。"
  #     redirect_to(root_path)
  #   end

  # end








  



# def indexx
#   begin
#   !params[:keyword].blank?
#   require 'google/apis/youtube_v3'
#   youtube = Google::Apis::YoutubeV3::YouTubeService.new
#   youtube.key = ENV['YOUTUBE_1']
#   youtube_search_list = youtube.list_searches("id,snippet", type: "video",
#                                                           q: params[:keyword],
#                                                           max_results: 2)
#   search_result = youtube_search_list.to_h
#   @movies = search_result[:items]
#   @post = Post.new
    
#   rescue Google::Apis::ClientError
#     flash[:alert] = "１日の上限に達しました。"
#     redirect_to(root_path)
#   end

# end





end