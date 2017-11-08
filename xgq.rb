#  xgq.rb
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
require_relative 'datayes'
require 'json'

class Xgq
	def initialize
		i=1
		while true do
			begin
			    ticker='0'*(6-i.to_s.length)+i.to_s
			    #puts ticker
				a=Datayes.new
				b=a.fetch_data("/api/equity/getEqu.json?ticker=#{ticker}&equTypeCD=A")
				i=i+1
			rescue
				i=i+1
			    next
			end
			puts b.inspect
		end
	end
end


x = Xgq.new

