#Brandテーブルの初期設定 
require "csv"
brand_array = CSV.read("db/brand.csv")
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
    elsif registration == brand[0]
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

#作成したDB情報を格納する
parent_address_info = []
children_address_info = []

#親子孫情報をCSVファイルからそれぞれ読み込む
category_parent = CSV.read("db/category_parent.csv")
category_children = CSV.read("db/category_children.csv")
category_grandchild = CSV.read("db/category_grandchild.csv")

#配列参照用カウント変数
parent_count = 0
children_count = 0

# 親カテゴリの作成
category_parent.each_with_index do |parent,i|
  tmp = Category.create(name: parent[0])
  parent_address_info[i] = tmp
end

# 子カテゴリの作成
category_children.each_with_index do |child,i|
  if child != []
    parent_data = parent_address_info[parent_count]
    tmp = parent_data.children.create(name: child[0])
    children_address_info[i] = tmp
  else
    parent_count = parent_count + 1
  end
end
#iが[]の箇所に対してもループが回ってしまっている。該当箇所がnilとなっているため削除する
children_address_info.compact!

#孫カテゴリの作成
category_grandchild.each_with_index do |gchild,i|
  if gchild != []
    children_data = children_address_info[children_count]
    children_data.children.create(name: gchild[0])
  else
    children_count = children_count + 1
  end
end