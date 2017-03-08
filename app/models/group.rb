require 'uuidtools'

class Group  < ApplicationRecord
  has_many :interfaces

  enum status: [:archived, :active]

  #validates
  validates :group_name, presence: true, length: { maximum: 50 }

  #scope
  default_scope { where("status>?", Group.statuses[:archived]) }
  scope :name_like, ->(name){ where "group_name like ? ", "%#{sanitize_sql_like(name)}%" }  #防sql注入

  #假删除
  def self.delete(group)
    group.status = :archived
    group.save
  end

  #设置属性值
  def self.set_attribute(group_params)
    group = Group.new(group_params)
    group.sid = UUIDTools::UUID.timestamp_create
    group.status = :active
    group
  end
end
