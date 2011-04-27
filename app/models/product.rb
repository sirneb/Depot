class Product < ActiveRecord::Base
  default_scope :order => 'title'

  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {
    :greater_than_or_equal_to => 0.01,
    #:message => 'invalid pricing value.'
  }
  validates :title, :uniqueness => true, :length => {
    :minimum => 10, :too_short => 'the title is just too short, try a longer one'
  } 
  validates :image_url, :format => {
    :with => %r{\.(gif|jpg|png)$}i,
    :message => 'must be a URL for GIF, JPG or PNG image.'
  }
end
