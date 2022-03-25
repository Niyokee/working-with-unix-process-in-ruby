puts "Parents process pid #{Process.pid}"

if fork
  puts "me: entered the if block from #{Process.pid}"
else
  puts "me: entered the else block from #{Process.pid}"
  puts "parent: entered the else block from #{Process.ppid}"
end

fork do
  puts "me: entered the else block from #{Process.pid}"
end