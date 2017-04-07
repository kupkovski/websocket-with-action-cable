module ApplicationHelper
  def show_message_dialect_icon(dialect)
    {
      :piglatin => '🐷',
      :valley_girl => '💅',
      :yoda => '👽',
      :ultraleet => '🤓'
    }[dialect.to_sym]
  end
end
