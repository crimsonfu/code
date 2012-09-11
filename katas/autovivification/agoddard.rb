#!/usr/bin/env ruby
require 'json'
input = 
"14305 1 open
16595 2 proj
16863 2 proj
17200 3 proj
18787 2 proj
19329 4 proj
19554 1 open
19810 2 proj
19997 1 open
21143 2 open
22101 2 open
22307 2 open
22400 2 open
23225 2 proj
23278 6 proj
24201 2 proj
24447 2 proj
24909 3 proj
25572 2 proj
25858 2 new
26080 1 open
26368 6 open
26565 1 open
26591 5 open
26787 1 open
26957 2 open
26982 1 open
27289 0 open
27758 5 open
27827 0 new
27924 0 new
27998 0 new"

class Issue
  attr_accessor :id, :priority, :type
  
  def initialize(logline)
    @id,@priority,@type = logline.split
  end
end

#we need a collection which we can search within and iterate over
class Issues < Array
  #grab all the ids of the Issues
  def ids
    self.collect{|issue| issue.id}.sort
  end
  #grab a list of priorities used in the issues
  def priorities
    self.collect{|issue| issue.priority}.uniq.sort
  end
  #grab a list of types used in the issues
  def types
    self.collect{|issue| issue.type}.uniq
  end
  #find issues by type
  def find_by_type(type)
    self.select{|issue| issue.type == type}
  end
end


#load the input data, making one Issue from each log line
issues = Issues.new
input.lines.to_a.each{|line| issues << Issue.new(line)}

#data1 (count issues by type)
data1 = Hash.new
issues.types.each do |type|
  data1[type] = issues.find_by_type(type).count
end

#data2 (print issue ids for each type)
data2 = Hash.new
issues.types.each do |type|
  ids = []
  issues.find_by_type(type).each do |issue|
    ids << issue.id
  end
  data2[type] = ids
end

#data3 (combine data1 and data2 in single output)
data3 = {:id_by_type => data2, :count => data1}


#data4 (list all issue ids)
data4 = issues.ids

puts JSON.pretty_generate([data1,data2,data3,data4])