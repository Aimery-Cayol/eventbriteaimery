class Event < ApplicationRecord

    validates :start_date, presence: true, inclusion: { in: (Date.today..Date.today+100.years) }
    validates :duration,  presence: true, numericality: { greater_than: 0}, if: :multiple_5?
    validates :title, presence: true, length: {minimum: 5, maximum: 140}, allow_blank: true
    validates :description, presence: true, length: {minimum: 20, maximum: 1000}, allow_blank: true
    validates :price, :numericality => {:greater_than => 1, :less_than => 1001}
    validates :location, presence: true 

    def multiple_5?
        errors.add(:duration, "must be a multiple of 5") if
        duration % 5 != 0
    end

    has_many :attendances
    has_many :users, through: :attendances
end
