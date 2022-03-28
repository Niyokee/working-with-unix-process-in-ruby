# fork do
#   5.times do
#     sleep 1
#     puts 'i am an orphan'
#   end
# end
#
# Process.wait
# abort 'parent process died...'


3.times do
  fork do
    sleep rand 5
  end
end

3.times do
  puts Process.wait
end

5.times do
  fork do
    if rand(5).even?
      exit 111
    else
      exit 112
    end
  end
end

5.times do
  pid, status = Process.wait2

  if status.exitstatus == 111
    puts "#{pid} encountered an even number"
  else
    puts "#{pid} encountered an odd number"
  end
end

2.times do
  fork do
    abort 'finished'
  end
end

puts Process.wait
sleep 5

puts Process.wait