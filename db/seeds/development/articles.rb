body =
  "あ。/n/n" +
  "い。/n/n" +
  "う。"

0.upto(9) do |idx|
  Article.create (
    title: "カウント#{idx}",
    body: body,
    released_at: 8days.ago.advance(days: idx),
  )
end
