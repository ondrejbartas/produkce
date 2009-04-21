class SystemComment < ActiveRecord::Base
      belongs_to :user
      
      has_many :system_comments
      belongs_to :system_comment
end
