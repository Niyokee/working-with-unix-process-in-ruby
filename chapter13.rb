require 'fiddle'

arr = [1, 2, 3]

fork do
  # 子プロセスの初期化
  # まだ子プロセスで書き込みがされないので、親プロセスのメモリを参照する
  p arr
end

fork do
  arr << 4
  p arr
end