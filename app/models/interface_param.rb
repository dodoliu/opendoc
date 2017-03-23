require 'uuidtools'

class InterfaceParam < ApplicationRecord
  after_save :clear_redis
  after_destroy :clear_redis

  belongs_to :interface

  enum status: [:archived, :active]
  #validates
  validates :param_name, presence: true, length: { maximum: 50 }

  #scope
  default_scope { where("status>?", InterfaceParam.statuses[:archived]) }
  scope :name_like, ->(name){ where "param_name like ? ", "%#{sanitize_sql_like(name)}%" }  #防sql注入

  #假删除
  def self.delete(interface_param)
    interface_param.status = :archived    
    interface_param.save
  end

  #设置属性值
  def self.set_attribute(interface_param_params)
    interface_param = InterfaceParam.new(interface_param_params)
    interface_param.sid = UUIDTools::UUID.timestamp_create
    interface_param.status = :active      
    interface_param
  end

  #清理redis缓存
  def clear_redis
    $redis.set("interface_params_#{interface_id}", '')
  end
end
