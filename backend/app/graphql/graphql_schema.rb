# frozen_string_literal: true

class GraphqlSchema < GraphQL::Schema
  # mutation(::MutationObject)
  # query(::QueryObject)

  use GraphQL::Batch

  # https://graphql-ruby.org/schema/introspection#disabling-introspection
  # 本番環境では、インスペクションエントリポイントを無効にします
  disable_introspection_entry_points if Rails.env.production?

  # GraphQL-Rubyは、クエリの実行中に何かがうまくいかない場合にこのメソッドを呼び出します：

  # ユニオンおよびインターフェースの解決
  def self.resolve_type(_abstract_type, _obj, _ctx)
    # TODO: このメソッドを実装して、`obj`の正しいGraphQLオブジェクトタイプを返します
    raise(GraphQL::RequiredImplementationMissingError)
  end

  # このエラー数に達した場合、検証を停止します：
  validate_max_errors(10)

  # Relayスタイルのオブジェクト識別：

  # `object`のための文字列UUIDを返します
  def self.id_from_object(object, _type_definition, _query_ctx)
    # 例えば、RailsのGlobalIDライブラリを使用します (https://github.com/rails/globalid)：
    object.to_gid_param
  end

  # 文字列UUIDが与えられた場合、オブジェクトを見つけます
  def self.object_from_id(global_id, _query_ctx)
    # 例えば、RailsのGlobalIDライブラリを使用します (https://github.com/rails/globalid)：
    GlobalID.find(global_id)
  end

  # `authorized?`がオブジェクトに対してfalseを返す場合の処理を行うためにこのフックをオーバーライドします：
  def self.unauthorized_object(error)
    # Add a top-level error to the response instead of returning nil:
    raise GraphQL::ExecutionError, "An object of type #{error.type.graphql_name} was hidden due to permissions"
  end
end
