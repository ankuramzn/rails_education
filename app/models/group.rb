class Group < ActiveRecord::Base
  has_many :people
  accepts_nested_attributes_for :people,
                                :allow_destroy => true,
                                :reject_if => proc { |attrs|
                                  attrs['name'].blank? &&
                                  attrs['photo_file'].blank?
                                }
end
