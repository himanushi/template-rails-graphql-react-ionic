# frozen_string_literal: true

# このファイルを変更した際は、必ずサーバーを再起動してください。

# パラメータを部分一致させて（例：passwがpasswordに一致する）、
# ログファイルからフィルタリングするように設定します。
# これにより、敏感な情報の拡散を制限できます。
# サポートされている表記法と動作については、ActiveSupport::ParameterFilterの
# ドキュメントを参照してください。
Rails.application.config.filter_parameters += %i[
  passw email secret token _key crypt salt certificate otp ssn
]
