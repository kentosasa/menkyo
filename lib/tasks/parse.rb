# URLにアクセスするためのライブラリの読み込み
require 'open-uri'
# Nokogiriライブラリの読み込み
require 'nokogiri'

# 画像 http://www5b.biglobe.ne.jp/~nobusann/777/honmen/
# リンク　http://www5b.biglobe.ne.jp/~nobusann/777/honmen/an1.html

puts ARGV[0]
url = ARGV[0]

doc = Nokogiri.HTML(open(url))
doc.css('tr').each do |e|
    #新規データ
    problem = Problem.new
    #本面データ
    problem.karimen = false
    #要素抽出
    tds = e.css("td")
    #解説
    num = 0
    explanation = ""
    tds[1].css("font").each do |e|
      if not explanation.include?(e)
        explanation += e.text
      end
    end
    explanation = explanation.gsub(" ", "").gsub("\n", "").gsub("　", "")

    #問題文
    problem.question_text = tds[1].text.gsub(explanation, "").gsub(" ", "").gsub("\n", "").gsub("　", "")

    #解説
    problem.explanation = explanation
    #答えの判断
    if tds[2].text.include?("正")
      problem.correct_answer = true
    else
      problem.correct_answer = false
    end
    #画像があるか判断
    if tds[1].css("img").present?
      problem.question_image_url = "http://www5b.biglobe.ne.jp/~nobusann/777/honmen/#{tds[1].css("img").attribute('src').value}"
    end
    problem.save
end