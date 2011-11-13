require 'restclient'

f = File.open('list.txt', 'r+')
o = File.new('res.txt', 'w+')
f.lines do |l|
  l = l.strip
  res = RestClient.get l
  if res.headers[:x_frame_options].nil?
    o.puts l + " : " + 'not blocked'
  else
    o.puts l + " : " + 'blocked'    
  end
end