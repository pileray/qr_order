%w[ビール 山崎ハイボール 響ハイボール ジンジャーハイボール カシスオレンジ テキーラ 日本酒].each do |name|
  Drink.create!(name: name, price: [800, 900, 1000].sample)
end
