class Category < ApplicationRecord
  has_many :projects

  def self.get_category_name(cat_id)
    self.where(id: cat_id).first.name
    #byebug
  end
end
