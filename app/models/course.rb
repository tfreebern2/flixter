class Course < ActiveRecord::Base
  belongs_to :user
  has_many :sections

  validates :title, :presence => { :message => "Title of Course is required" }
  validates :description, :presence => { :message => "Description of Course is required" }
  validates :cost, :presence => { :message => "Cost of Course is required" }, numericality: {greater_than_or_equal_to: 0}
end
