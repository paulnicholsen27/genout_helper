class Singer < ApplicationRecord

        validates :first_name, presence: true
        validates :last_name, presence: true
        validates :phone_number, presence: true, phone: true

        def phone_number=(str) 
            @phone_number = str.tr('^0-9', '')
        end
end
