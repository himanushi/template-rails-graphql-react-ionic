# frozen_string_literal: true

require 'active_support/core_ext/integer/time'

Rails.application.configure do
  # ここに指定された設定は、config/application.rbの設定よりも優先されます。

  # 開発環境では、アプリケーションのコードが変更されるたびに再読み込みされます。
  # これにより応答時間が遅くなりますが、コード変更時にウェブサーバーを再起動する必要がないため、
  # 開発には最適です。
  config.enable_reloading = true

  # ブート時にコードをイーガーロードしない。
  config.eager_load = false

  # 完全なエラーレポートを表示します。
  config.consider_all_requests_local = true

  # サーバーのタイミングを有効にします。
  config.server_timing = true

  # キャッシュの有効/無効を設定します。デフォルトではキャッシュは無効です。
  # rails dev:cacheを実行してキャッシュを切り替えます。
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    config.cache_store = :memory_store
    config.public_file_server.headers = { 'Cache-Control' => "public, max-age=#{2.days.to_i}" }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # アップロードされたファイルをローカルファイルシステムに保存します（オプションはconfig/storage.ymlを参照）。
  # config.active_storage.service = :local

  # 非推奨の通知をRailsロガーに出力します。
  config.active_support.deprecation = :log

  # 非推奨の警告が発生した場合に例外を発生させます。
  config.active_support.disallowed_deprecation = :raise

  # 非推奨メッセージを禁止するためのActive Supportに通知します。
  config.active_support.disallowed_deprecation_warnings = []

  # ページロード時に保留中のマイグレーションがある場合にエラーを発生させます。
  config.active_record.migration_error = :page_load

  # ログでデータベースクエリを引き起こしたコードを強調表示します。
  config.active_record.verbose_query_logs = true

  # ログでバックグラウンドジョブをエンキューしたコードを強調表示します。
  # config.active_job.verbose_enqueue_logs = true

  # 翻訳が欠落している場合にエラーを発生させます。
  # config.i18n.raise_on_missing_translations = true

  # レンダリングされたビューにファイル名を注釈として追加します。
  config.action_view.annotate_rendered_view_with_filenames = true

  # before_actionのonly/exceptオプションが欠落したアクションを参照する場合にエラーを発生させます。
  config.action_controller.raise_on_missing_callback_actions = true

  # `bin/rails generate`によって生成されたファイルに対してRubocopによる自動修正を適用します。
  # config.generators.apply_rubocop_autocorrect_after_generate!
end
