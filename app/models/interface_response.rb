require 'uuidtools'

class InterfaceResponse < ApplicationRecord
  enum status: [:archived, :active]

  #validates
  validates :TODO, presence: true, length: { maximum: 50 }
  validates :TODO, numericality: true

  #scope
  default_scope { where("status>?", Interface_response.statuses[:archived]) }
  scope :name_like, ->(name){ where "name like ? ", "%#{sanitize_sql_like(name)}%" }  #防sql注入

  #假删除
  def self.delete(interface_response)
    interface_response.status = :archived    
    interface_response.save
  end

  #设置属性值
  def self.set_attribute(interface_response_params)
    interface_response = Interface_response.new(interface_response_params)
    interface_response.sid = UUIDTools::UUID.timestamp_create
    interface_response.status = :active      
    interface_response
  end
end
