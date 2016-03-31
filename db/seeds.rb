# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.new(:email => 'hogehoge@hoge.com', :password => 'hogehoge')
user.save!
user.update(:first_name => '太郎', :family_name => "山田", :self_introduction => "SFC3年です。宜しくお願いします！")
if User.find(1) != nil
  Post.create(:content => "やばい。このままでは遅刻", :place => "湘南台", :user_id => 1)
  Post.create(:content => "七夕祭で炎上", :place => "藤沢", :user_id => 1)
end