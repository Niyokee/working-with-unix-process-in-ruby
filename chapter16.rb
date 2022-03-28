child_process = 3
dead_process = 0

# 子プロセスを3つ生成する
child_process.times do
  fork do
    sleep 3
  end
end

# CHLDハンドラの中でputsの出力をバッファリングしないよう、
# $stdout の出力を同期モードに設定する
# こうすることで、もし puts を呼び出した後にシグナルハンドラが
# 中断された場合には、 ThreadError 例外が送出されるようになる
# これはシグナルハンドラでIOを扱う場合の一般的な流儀である

# この後、親プロセスは重い計算処理で忙しくなるが
# 子プロセスの終了は検知したい
trap(:CHLD) do
  begin
    while (pid = Process.wait(-1, Process::WNOHANG))
      puts pid
      dead_process += 1
    end
  rescue Errno::ECHILD
    # Ignored
  end
end

loop do
  exit if dead_process == child_process
  (Math.sqrt(rand(44)) ** 4).floor
end