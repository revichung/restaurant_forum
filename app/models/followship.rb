class Followship < ApplicationRecord
  belongs_to :user #每筆追蹤記錄屬於發出追蹤的使用者
  belongs_to :following, class_name: "User"
  #每筆追蹤記錄屬於被追蹤的使用者(因為兩邊都是user,所以被追蹤的使用者自訂為following)
  #class_name是告訴rails要去User資料表找following_id
end
