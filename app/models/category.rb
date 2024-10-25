class Category < ApplicationRecord
    has_many :tasks, dependent: :destroy

    validates :name, presence: true
    validates :details, presence: true
end
