#建立假資料

namespace :dev do #讓指令出現前綴,有助於指令的結構化管理,如同rails db:migrate
  task fake_restaurant: :environment do #定義執行指令為rails dev:fake,:environment讓Rake與Model和資料庫互動
    Restaurant.destroy_all #先清除舊資料

    500.times do |i|
      Restaurant.create!(name: FFaker::Company.name,
      opening_hours: FFaker::Time.day_of_week,
      tel: FFaker::PhoneNumber.short_phone_number,
      address: FFaker::Address.street_address,
      description: FFaker::Lorem.paragraph,
      category: Category.all.sample)
    end

    #提示任務執行完畢
    puts "have created fake restaurants"
    puts "now you have #{Restaurant.count} restaurants data"
  end


  task fake_user: :environment do
    20.times do |i|
      user_name = FFaker::Name.first_name
      User.create!(
        email: "#{user_name}@example.com",
        password: "sample"
      )
    end

    puts "have created fake users"
    puts "now you have #{User.count} users data"
  end


  task fake_comment: :environment do
    Restaurant.all.each do |restaurant|
      3.times do |i|
        restaurant.comments.create!(
          content: FFaker::Lorem.sentence,
          user: User.all.sample
        )
      end
    end

    puts "have created fake comments"
    puts "now you have #{Comment.count} comment data"
  end
  
end