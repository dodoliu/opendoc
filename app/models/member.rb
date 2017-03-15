require 'uuidtools'

class Member < ApplicationRecord
  has_and_belongs_to_many :groups

  enum status: [:archived, :active]

  #validates
  validates :display_name, uniqueness: true, presence: true, length: { maximum: 50 }

  #scope
  default_scope { where("status>?", Member.statuses[:archived]) }
  scope :name_like, ->(name){ where "display_name like ? ", "%#{sanitize_sql_like(name)}%" }  #防sql注入

  #假删除
  def self.delete(member)
    member.status = :archived    
    member.save
  end

  #设置属性值
  def self.set_attribute(member_params)
    member = Member.new(member_params)
    member.sid = UUIDTools::UUID.timestamp_create
    member.status = :active      
    member
  end
end
