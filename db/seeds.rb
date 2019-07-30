#Brandテーブルの初期設定
require "csv"
brand_array = CSV.read('db/brand.csv')
registration_array = ["brand"]
first_flag = true

#brand.csvで取得したデータにはブランドが重複して存在するので別配列に格納し、重複を無くす
brand_array.each do |brand|
  registration_array.each_with_index do |registration,i|
    if first_flag 
      #初回ループ時のみ、一致確認をせずデータを配列に格納する
      registration_array[0] = brand[0]
      first_flag = false
      break
    elsif registration.eql?(brand[0])
      break
    elsif i == registration_array.size - 1
      registration_array.push(brand[0])
    end
  end
end

#重複していないブランドデータをBrandテーブルのnameカラムに登録する
registration_array.each do |registration_name|
  Brand.create(name: registration_name)
end