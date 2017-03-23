require 'uuidtools'

class InterfaceResponse < ApplicationRecord
  after_save :clear_redis
  after_destroy :clear_redis

  belongs_to :interface

  enum status: [:archived, :active]

  #validates
  validates :response_name, presence: true, length: { maximum: 50 }

  #scope
  default_scope { where("status>?", InterfaceResponse.statuses[:archived]) }
  scope :name_like, ->(name){ where "response_name like ? ", "%#{sanitize_sql_like(name)}%" }  #防sql注入

  #假删除
  def self.delete(interface_response)
    interface_response.status = :archived    
    interface_response.save
  end

  #设置属性值
  def self.set_attribute(interface_response_params)
    interface_response = InterfaceResponse.new(interface_response_params)
    interface_response.sid = UUIDTools::UUID.timestamp_create
    interface_response.status = :active      
    interface_response
  end

  #清理redis缓存
  def clear_redis
    $redis.set("interface_responses_#{interface_id}", '')
  end
end
