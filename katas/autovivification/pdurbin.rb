#!/usr/bin/env ruby
# heavily based on http://danceb.in/WoxuBh354RGIgggl9DNYg (Expires: 2012-09-14 18:51:25)
# via http://irclog.perlgeek.de/crimsonfu/2012-09-07#i_5970458
require 'json'

input = ''
while gets
	input << $_
end

data = []

# put lines into an array and iterate on each
input.lines.to_a.each { |line|
	# build an array of hashes, one hash for each line
	data << Hash[
		# 3 keys get the 3 split values zip'ed into them
		[:id, :pri, :type].zip(line.split(' '))
	]
}

#puts data.to_json

data1 = Hash.new(0)

# collect returns an array
data.collect{|h|
	h[:type]}.each{|type|
	# to_sym yields "type" in this case (string of variable name)
	# to_s seems to work too but be less memory efficient?
	data1[type.to_sym] += 1
	#data1[type.to_s] += 1
}

data2 = {}

# TODO: comment this
data.collect{|h| h[:type]}.uniq.each{|type| data2[type] = data.collect{|h| h[:id] if h[:type] == type}.compact}

# this is kind of cheating, isn't it?
data3 = {:id_by_type => data2, :counts => data1}

data4 = data.collect{ |h| h[:id] }

final = [data1, data2, data3, data4]
puts final.to_json
