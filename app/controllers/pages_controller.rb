class PagesController < ApplicationController
  def home
  end

  def authentication_callback
     auth = request.env['omniauth.auth']
     object_id = auth["extra"]["raw_info"]["object_id"]
     object_type = auth["extra"]["raw_info"]["object_type"]

     @result_from_login = HTTParty.post(ENV['LOGIN_URL'].to_str,
        :body => { :user =>{ :email => ENV['VENDOR_USER_EMAIL'] , :password => ENV['VENDOR_USER_PASSWORD'] }}.to_json,
        :headers => { 'Content-Type' => 'application/json' } )
     query = { "search" => object_id}
     barear_token = @result_from_login["token"]

     @result_form_golfer_search = HTTParty.get(ENV['SEARCH_GOLFER_URL'].to_str,
         :query => query,
         :headers => {"Authorization" => "Bearer #{barear_token}" , 'Content-Type' => 'application/json' } )
     result = JSON.parse @result_form_golfer_search.body.gsub('=>', ':')
     @ghin_number = result["golfers"].first["ghin"]
     @golfer_name = result["golfers"].first["first_name"] + " " + result["golfers"].first["last_name"]
     @golfer_hi = result["golfers"].first["hi_display"]
  end
end
