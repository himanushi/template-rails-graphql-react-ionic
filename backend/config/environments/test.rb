# frozen_string_literal: true

require 'active_support/core_ext/integer/time'

# テスト環境はアプリケーションのテストスイートを実行するために専用に使用されます。
# その他の目的で作業する必要はありません。テストデータベースは
# テストスイートの「スクラッチスペース」であり、テストの実行間に
# クリアされて再作成されます。そこにあるデータには依存しないでください！

Rails.application.configure do
  # ここに指定された設定は、config/application.rbの設定よりも優先されます。

  # テストを実行している間、ファイルは監視されませんが、
  # 再読み込みは必要ありません。
  config.enable_reloading = false

  # イーガーロードはアプリケーション全体をロードします。ローカルで単体テストを実行する際、
  # 通常は必要ありませんが、テストスイートを遅くすることがあります。
  # ただし、コードをデプロイする前にイーガーロードが正常に機能していることを
  # 確保するために、継続的インテグレーションシステムでは有効にすることが推奨されます。
  config.eager_load = ENV['CI'].present?

  # テスト用の公開ファイルサーバーを設定し、パフォーマンス向上のためにCache-Controlを設定します。
  config.public_file_server.headers = { 'Cache-Control' => "public, max-age=#{1.hour.to_i}" }

  # 完全なエラーレポートを表示し、キャッシュを無効にします。
  config.consider_all_requests_local = true
  config.action_controller.perform_caching = false
  config.cache_store = :null_store

  # レスキュー可能な例外に対して例外テンプレートをレンダリングし、
  # 他の例外についてはエラーを発生させます。
  config.action_dispatch.show_exceptions = :rescuable

  # テスト環境でリクエスト偽造防止を無効にします。
  config.action_controller.allow_forgery_protection = false

  # アップロードされたファイルをローカルファイルシステムの一時ディレクトリに保存します。
  # config.active_storage.service = :test

  # 非推奨の通知を標準エラーに出力します。
  config.active_support.deprecation = :stderr

  # 非推奨の警告が発生した場合に例外を発生させます。
  config.active_support.disallowed_deprecation = :raise

  # 非推奨メッセージを禁止するためのActive Supportに通知します。
  config.active_support.disallowed_deprecation_warnings = []

  # 翻訳が欠落している場合にエラーを発生させます。
  # config.i18n.raise_on_missing_translations = true

  # レンダリングされたビューにファイル名を注釈として追加します。
  # config.action_view.annotate_rendered_view_with_filenames = true

  # before_actionのonly/exceptオプションが欠落したアクションを参照する場合にエラーを発生させます。
  config.action_controller.raise_on_missing_callback_actions = true
end
