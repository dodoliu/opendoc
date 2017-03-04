require 'uuidtools'

class Member < ApplicationRecord
  enum status: [:archived, :active]

  #validates
  validates :TODO, presence: true, length: { maximum: 50 }
  validates :TODO, numericality: true

  #scope
  default_scope { where("status>?", Member.statuses[:archived]) }
  scope :name_like, ->(name){ where "name like ? ", "%#{sanitize_sql_like(name)}%" }  #防sql注入

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
