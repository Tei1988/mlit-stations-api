class ServiceProviderType < ActiveHash::Base
  include ActiveModel::Validations

  fields :id, :name

  validates :id,   presence: true
  validates :name, presence: true

  self.data = [
    { id: 1, name: '新幹線' },
    { id: 2, name: 'JR在来線' },
    { id: 3, name: '公営鉄道' },
    { id: 4, name: '民営鉄道' },
    { id: 5, name: '第三セクター' },
  ]
end
