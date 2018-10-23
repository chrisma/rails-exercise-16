class Paper < ApplicationRecord
    #Scopes
    # scope :published_in, ->(year) { where("year == ?", year)}
    
    #Validations
    validates :title, presence: true
    validates :venue, presence: true
    validates :year, numericality: true, presence: true

    # Relations
    has_and_belongs_to_many :authors
end
