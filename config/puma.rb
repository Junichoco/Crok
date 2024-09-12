root_dir = "/var/www/Crok/current"

max_threads_count = ENV.fetch("RAILS_MAX_THREADS", 5)
min_threads_count = ENV.fetch("RAILS_MIN_THREADS", max_threads_count)
threads min_threads_count, max_threads_count

environment ENV.fetch("RAILS_ENV") { "production" }

pidfile ENV.fetch("PIDFILE") { "tmp/pids/puma.pid" }
state_path ENV.fetch("STATE_PATH") { "tmp/pids/puma.state" }

bind "unix://#{root_dir}/tmp/sockets/puma.sock"
stdout_redirect File.expand_path("log/puma_access.log"), File.expand_path("log/puma_error.log"), true

preload_app!

workers ENV.fetch("WEB_CONCURRENCY", 2)
plugin :tmp_restart

daemonize
