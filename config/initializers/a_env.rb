ENV['LOGIN_URL'] ||= "https://whs-dev.herokuapp.com/api/v1/users/login.json"
ENV['SEARCH_GOLFER_URL'] ||= "https://whs-dev.herokuapp.com/api/v1/golfers.json?page=1&per_page=25&global_search=true&sorting_criteria=full_name&order=asc"
ENV['VENDOR_USER_EMAIL'] ||= 'sampleappclient@noemail.com'
ENV['VENDOR_USER_PASSWORD'] ||= '123456'
ENV["OAUTH_ID"] ||= 'Kv7IqaAS0NgXvB8ogZh_eKaC1N0VlBhNHC5Wd9xQ5iA'
ENV["OAUTH_SECRET"] ||= '2HLuYiSPjTCf7MiZye45nd6OyYN0R8SocxkHMZUaTDg'
