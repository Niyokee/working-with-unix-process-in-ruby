message = 'Good Morning'
recipient = 'tree@backyard.com'

pid = fork do
  p message, recipient
end

Process.detach pid
