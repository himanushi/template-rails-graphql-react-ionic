# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# 使用するフレームワークを選択します：
require 'active_model/railtie'
# require 'active_job/railtie'
require 'active_record/railtie'
# require 'active_storage/engine'
require 'action_controller/railtie'
# require "action_mailer/railtie"
# require 'action_mailbox/engine'
# require 'action_text/engine'
require 'action_view/railtie'
# require "action_cable/engine"
# require "rails/test_unit/railtie"

# GemfileにリストされているGemを要求します。
# :test、:development、または:productionに制限されているGemも含まれます。
Bundler.require(*Rails.groups)

module Backend
  class Application < Rails::Application
    # 元々生成されたRailsバージョンの設定デフォルトを初期化します。
    config.load_defaults 7.2

    # `.rb`ファイルを含まない、または再読み込みまたはイーガーロードすべきでない
    # その他の`lib`サブディレクトリは、`ignore`リストに追加してください。
    # 一般的なものは、`templates`、`generators`、または`middleware`などです。
    config.autoload_lib(ignore: %w[assets tasks])

    # アプリケーション、エンジン、ロールタイの設定がここにあります。
    #
    # これらの設定は、後で処理されるconfig/environmentsのファイルを使用して
    # 特定の環境でオーバーライドできます。
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # システムテストファイルを生成しないようにします。
    config.generators.system_tests = nil
  end
end
