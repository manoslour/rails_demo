class Section < ApplicationRecord
  belongs_to :post

  PRIORITY = ['Section::Important', 'Section::Default']

  Default = Class.new(Section)
  Important = Class.new(Section)

end
