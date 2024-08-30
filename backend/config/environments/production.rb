# frozen_string_literal: true

require 'active_support/core_ext/integer/time'

Rails.application.configure do
  # ここに指定された設定は、config/application.rbの設定よりも優先されます。

  # リクエスト間でコードは再読み込みされません。
  config.enable_reloading = false

  # ブート時にコードをイーガーロードします。これにより、Railsと
  # アプリケーションのほとんどがメモリにロードされ、スレッド対応のウェブサーバーと
  # コピーオンライトを利用するサーバーがより良く動作します。
  # Rakeタスクはパフォーマンスのためにこのオプションを自動的に無視します。
  config.eager_load = true

  # 完全なエラーレポートは無効になり、キャッシュが有効になります。
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true

  # ENV["RAILS_MASTER_KEY"]、config/master.key、または環境
  # キー（config/credentials/production.keyなど）でマスターキーが
  # 使用可能であることを確認します。このキーは、資格情報（および
  # 他の暗号化ファイル）を復号化するために使用されます。
  # config.require_master_key = true

  # 静的ファイルを`public/`から提供するのを無効にし、NGINX/Apacheに
  # それを行わせます。
  # config.public_file_server.enabled = false

  # 画像、スタイルシート、およびJavaScriptをアセットサーバーから提供するのを有効にします。
  # config.asset_host = "http://assets.example.com"

  # サーバーがファイルを送信するために使用するヘッダーを指定します。
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for Apache
  # config.action_dispatch.x_sendfile_header = "X-Accel-Redirect" # for NGINX

  # アップロードされたファイルをローカルファイルシステムに保存します（オプションはconfig/storage.ymlを参照）。
  # config.active_storage.service = :local

  # アプリへのすべてのアクセスがSSL終了逆プロキシを通じて行われていると仮定します。
  # これは、config.force_sslと一緒にStrict-Transport-Securityおよび
  # セキュアクッキーに使用できます。
  # config.assume_ssl = true

  # アプリへのすべてのアクセスをSSL経由に強制し、Strict-Transport-Securityを使用し、
  # セキュアクッキーを使用します。
  config.force_ssl = true

  # デフォルトのヘルスチェックエンドポイントのhttpからhttpsへのリダイレクトをスキップします。
  # config.ssl_options = { redirect: { exclude: ->(request) { request.path == "/up" } } }

  # デフォルトでSTDOUTにログを出力します。
  config.logger = ActiveSupport::Logger.new($stdout)
                                       .tap  { |logger| logger.formatter = Logger::Formatter.new }
                                       .then { |logger| ActiveSupport::TaggedLogging.new(logger) }

  # すべてのログ行の前に次のタグを追加します。
  config.log_tags = [:request_id]

  # "info"はシステム操作に関する一般的で有用な情報を含みますが、個人を特定できる情報
  # （PII）を不注意に露出するのを避けるために、あまり情報をログに出力しません。
  # すべてをログに出力したい場合は、レベルを"debug"に設定します。
  config.log_level = ENV.fetch('RAILS_LOG_LEVEL', 'info')

  # 本番環境で異なるキャッシュストアを使用します。
  # config.cache_store = :mem_cache_store

  # Active Jobに対して実際のキューイングバックエンドを使用します（環境ごとに
  # 別々のキュー）。
  # config.active_job.queue_adapter = :resque
  # config.active_job.queue_name_prefix = "backend_production"

  # I18nのためのロケールフォールバックを有効にします（翻訳が見つからない場合に
  # I18n.default_localeにフォールバックします）。
  config.i18n.fallbacks = true

  # 非推奨のメッセージをログに出力しません。
  config.active_support.report_deprecations = false

  # マイグレーションの後にスキーマをダンプしません。
  config.active_record.dump_schema_after_migration = false

  # DNS再バインディング保護および他の`Host`ヘッダー攻撃を有効にします。
  # config.hosts = [
  #   "example.com",     # example.comからのリクエストを許可
  #   /.*\.example\.com/ # www.example.comのようなサブドメインからのリクエストを許可
  # ]
  # デフォルトのヘルスチェックエンドポイントのためのDNS再バインディング保護をスキップします。
  # config.host_authorization = { exclude: ->(request) { request.path == "/up" } }
end
