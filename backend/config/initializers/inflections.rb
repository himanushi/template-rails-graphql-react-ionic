# frozen_string_literal: true

# このファイルを変更した際は、必ずサーバーを再起動してください。

# 次の形式を使用して新しい単語の屈折ルールを追加します。屈折は
# ロケールに特有のもので、必要に応じて複数の異なる
# ロケールのルールを定義できます。以下の例はすべてデフォルトで有効です：
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, "\\1en"
#   inflect.singular /^(ox)en/i, "\\1"
#   inflect.irregular "person", "people"
#   inflect.uncountable %w( fish sheep )
# end

# これらの屈折ルールはサポートされていますが、デフォルトでは有効ではありません：
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym "RESTful"
# end
