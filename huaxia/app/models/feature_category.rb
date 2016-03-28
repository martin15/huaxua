class FeatureCategory < ActiveRecord::Base
  attr_accessible :name, :color, :permalink, :order_no
  has_permalink :name, :update => true

  has_many :features, :order => :order_no

  validates :color, :presence => true
  validates :name, :presence => true,
                   :length => {:minimum => 1, :maximum => 254}

  def self.list_type
     self.order("name").map{|x| [x.name, x.id]}
  end

  def self.default
    FeatureCategory.order(:order_no).first
  end
end