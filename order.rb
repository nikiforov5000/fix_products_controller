class Order < ActiveRecord::Base
    has_many :products
    has_one :customer
end