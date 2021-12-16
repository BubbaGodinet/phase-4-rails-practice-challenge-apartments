class Apartment < ApplicationRecord
    validates :number, presence: true
    has_many :tenants
    has_many :leases
end
