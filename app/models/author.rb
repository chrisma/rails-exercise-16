class Author < ApplicationRecord
    # Validations
    validates :last_name, presence: true

    # Relations
    has_and_belongs_to_many :papers

    def name
        "#{self.first_name} #{self.last_name}"
    end
end
