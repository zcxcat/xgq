#  datayes.rb
#  
#  Copyright 2017 Rex Zhang <rexzhang@cienet.com.cn>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  
#  

require 'net/http'
require 'httparty'
require_relative 'token'

class Datayes

HTTPS_URL='api.wmcloud.com'.freeze
TOKEN='dbf8db71ac18905a35a764ba5cd36c24c5c2c11a73357780fe5198ac02200818'
SUCCESS_CODE=1

  def fetch_data(api_path)
    url=URI.encode("https://#{HTTPS_URL}:443/data/v1/#{api_path}")
   # puts url
    resp=HTTParty.get url, headers: {'Authorization'=>"Bearer #{TOKEN}"}
    puts resp['retCode']
    raise resp['retMsg'] || resp['message'] if resp['retCode'] != SUCCESS_CODE
    puts resp['retCode']
    resp['data']
  end
end



