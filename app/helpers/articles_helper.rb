module ArticlesHelper
    def render_article_body_with_blanks(body, mode)
        # 穴埋め問題モードであるならば、{{単語}}で囲った部分を<span>タグに変換する
        if mode == 'quiz'
            body.gsub(/\{\{(.*?)\}\}/) do
                "<span class='fill-blank'>#{$1}</span>"
            end.html_safe
        # 閲覧モードであるならば、そのまま表示
        else
            simple_format(body)
        end
    end
end
