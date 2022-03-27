class Challenge < ApplicationRecord
    has_many :instances, dependent: :destroy
end
