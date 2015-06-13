rails_root = `pwd`.chomp
workers 2
threads( 0, 16 )
bind        "tcp://127.0.0.1:3000"
# Unixドメインソケットを利用する場合
# bind      "unix:#{rails_root}/tmp/sockets/puma.sock"
pidfile     "#{rails_root}/tmp/pids/puma.pid"
# state_path  "#{rails_root}/tmp/puma.state"
activate_control_app