# プロセスには環境（環境変数）がある
# 全てのプロセスは親プロセスから環境変数を引きつぐ

# hashアクセスはできるけど、hashではない
puts ENV['PATH']
puts ENV.has_key? 'PATH'
puts ENV.is_a?(Hash)