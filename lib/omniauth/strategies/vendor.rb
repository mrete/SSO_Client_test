module OmniAuth
  module Strategies
    class Vendor < OmniAuth::Strategies::OAuth2
      option :name, :vendor

      option :client_options, {
        site: "http://localhost:3000",
        authorize_path: "/oauth/authorize"
      }

     extra do
       {
         "raw_info": raw_info
       }
     end

     def raw_info
       @raw_info ||= access_token.get("/api/v1/get_user_information").parsed
     end
      
    end
  end
end
