class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  enum status: [:archived, :active]

  #validates
  validates :email, uniqueness: true, presence: true, length: { maximum: 50 }

  #scope
  default_scope { where("status>?", User.statuses[:archived]) }
  scope :name_like, ->(name){ where "display_name like ? ", "%#{sanitize_sql_like(name)}%" }  #防sql注入

  #假删除
  def self.delete(user)
    user.status = :archived    
    user.save
  end

  #设置属性值
  def self.set_attribute(user_params)
    user = User.new(user_params)
    user.status = :active      
    user
  end
end
