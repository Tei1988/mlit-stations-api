# frozen_string_literal: true

class RailwayType < ActiveHash::Base
  include ActiveModel::Validations

  fields :id, :name

  validates :id,   presence: true
  validates :name, presence: true

  self.data = [
    { id: 11, name: '普通鉄道JR' },
    { id: 12, name: '普通鉄道' },
    { id: 13, name: '鋼索鉄道' },
    { id: 14, name: '懸垂式鉄道' },
    { id: 15, name: '跨座式鉄道' },
    { id: 16, name: '案内軌条式鉄道' },
    { id: 17, name: '無軌条鉄道' },
    { id: 21, name: '軌道' },
    { id: 22, name: '懸垂式モノレール' },
    { id: 23, name: '跨座式モノレール' },
    { id: 24, name: '案内軌条式' },
    { id: 25, name: '浮上式' },
  ]
end
