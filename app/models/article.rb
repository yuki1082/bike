class Article < ActiveRecord::Base
   attr_accessible :title, :body, :status
   STATUS_VALUES = %w(draft public)
   validates :status, inclusion: {in: STATUS_VALUES}
   belongs_to :user
   scope :commom, where(status: "public")
   scope :full,  ->(user){where("status <> ? OR user_id = ?", "draft", user.id)}
   scope :readable_for, ->(user){user.kind_of?(User) ? full(user) : commom}
end
