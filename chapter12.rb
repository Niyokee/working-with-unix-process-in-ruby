fork do
  5.times do
    sleep 1
    puts 'i am an orphan'
  end
end

abort 'parent process died...'