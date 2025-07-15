module ArticlesHelper
  # 穴埋め問題機能用のアクション
  def fill_in_blank(text, mode)
    text = sanitize(text)
    text.gsub(/\[\[(.*?)\]\]/) do
      matched_word = Regexp.last_match(1)
      if mode == 'blank'
        content_tag(:span, matched_word, class: 'blank-mode')
      else
        matched_word
      end
    end
  end
end
