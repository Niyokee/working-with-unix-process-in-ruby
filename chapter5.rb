# Unixの世界では全てがファイルである
# ファイルディスクリプタは関連しないプロセス間では共有されない

passwd = File.open('/etc/passwd')
puts passwd.fileno

hosts = File.open('/etc/hosts')
puts hosts.fileno

passwd.close

null = File.open('/dev/null')
puts null.fileno

puts "標準入力ファイルディスクリプタ番号: 　　　#{STDIN.fileno}"
puts "標準出力ファイルディスクリプタ番号: 　　　#{STDOUT.fileno}"
puts "標準エラー入力ファイルディスクリプタ番号: #{STDERR.fileno}"