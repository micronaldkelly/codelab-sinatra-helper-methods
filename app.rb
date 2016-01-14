require 'sinatra'
class MyWebApp < Sinatra::Base
  # get '/' do
  #  "You are a Pawn in this game, #{Time.now.year}"
  #end
  get '/' do
    erb :generator
  end
  get '/about' do
    erb :about
  end
  get '/story' do
    erb :story
  end
  helpers do
    def current_year
      Time.now.year
    end
    def current_date(country)
      if country == 'usa' || country == 'canada'
        current_date_mdy
      else
        current_date_dmy
      end
    end

    def current_date_mdy
      current_time = Time.now
      "#{ month.day }/#{ current_time.day }/#{ current_time.year }"
    end

    def current_date_dmy
      current_time = Time.now
      "#{ current_time.day }/#{ current_time.month }/#{ current_time.year }"
    end
    def current_date(country)
      if country.casecmp('usa') == 0 || country.casecmp('canada') == 0
        current_date_mdy
      else
        current_date_dmy
      end
    end
    def pluralize(number, text)
      if number.to_f != 1
        %(#{text}s)
      else
        text
      end
    end
    def use_google_font(font)
      %(<link href='https://fonts.googleapis.com/css?family=#{font}' rel='stylesheet' type='text/css'>)
    end
    def icon(default)
      %(<span class="glyphicon glyphicon-#{default}" aria-hidden="true"></span>)
    end
  end
end
