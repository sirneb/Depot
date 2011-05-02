class Product < ActiveRecord::Base
  default_scope :order => 'title'
  has_many :line_items
  has_many :orders, :through => :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, :image_url, :locale, :presence => true
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

  private

    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end

    def self.find_all_by_locale
      find(:all, :conditions => {:locale => I18n.locale}, :order => "created_at")
    end
end
