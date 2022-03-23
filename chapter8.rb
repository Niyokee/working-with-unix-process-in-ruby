# プロセスには引数がある
# どの言語にもrubyのARGV相当の処理がある
# ARGVは配列である

#ruby chapter8.rb foo bar -va
p ARGV
#=>["foo", "bar", "-va"]

# ユーザーからhelpオプションが渡されたか確認する
p ARGV.include?('--help')
# -cオプションの値を取得する
p ARGV.include?('-c') && ARGV[ARGV.index('-c')+1]