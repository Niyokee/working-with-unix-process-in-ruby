# プロセスにはリソースの制限がある
# プロセスあたり、どれくらいのファイルディスクリプタを持てる？
# => システムの設定による


limit = Process.getrlimit(:NOFILE)

# see sysctl(8)
puts "ソフトリミット: #{limit[0]}, ハードリミット: #{limit[1]}"
puts "システム上のリミット: #{Process::RLIM_INFINITY}"

# ソフトリミットを引き上げる
Process.setrlimit(:NOFILE, 4096)
new_limit = Process.getrlimit(:NOFILE)
puts "ソフトリミット: #{new_limit[0]}, ハードリミット: #{new_limit[1]}"

# 制限を超えた時、例外を投げる
# Process.setrlimit(:NOFILE, 3)
# File.open('/dev/null')

# プロセスのユーザーが作成できる最大プロセス数
puts "プロセスのユーザーが作成できる最大プロセス数: #{Process.getrlimit(:NPROC)}"
# プロセスが作成できるファイルサイズの最大値
puts "プロセスが作成できるファイルサイズの最大値: #{Process.getrlimit(:FSIZE)}"
# プロセススタックの最大サイズ
puts "プロセススタックの最大サイズ: #{Process.getrlimit(:STACK)}"

# プロセスが同時に数千のネットワークコネクションを扱う場合必要になるかも
