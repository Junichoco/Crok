# デプロイ先のアプリケーション名
set :application, 'Crok'

# リポジトリのURL
set :repo_url, 'git@github.com:username/Crok.git'

# デプロイ先のディレクトリ
set :deploy_to, '/var/www/Crok'

# ブランチ
set :branch, 'main'

# シンボリックリンクを貼るディレクトリ/ファイル
append :linked_files, 'config/database.yml', 'config/master.key'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'storage'

# rbenvの設定
set :rbenv_type, :user
set :rbenv_ruby, '3.1.2'

# Keep the last 5 releases
set :keep_releases, 5
