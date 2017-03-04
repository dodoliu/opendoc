require 'uuidtools'

class InterfaceParam < ApplicationRecord
  enum status: [:archived, :active]

  #validates
  validates :TODO, presence: true, length: { maximum: 50 }
  validates :TODO, numericality: true

  #scope
  default_scope { where("status>?", Interface_param.statuses[:archived]) }
  scope :name_like, ->(name){ where "name like ? ", "%#{sanitize_sql_like(name)}%" }  #防sql注入

  #假删除
  def self.delete(interface_param)
    interface_param.status = :archived    
    interface_param.save
  end

  #设置属性值
  def self.set_attribute(interface_param_params)
    interface_param = Interface_param.new(interface_param_params)
    interface_param.sid = UUIDTools::UUID.timestamp_create
    interface_param.status = :active      
    interface_param
  end
end
