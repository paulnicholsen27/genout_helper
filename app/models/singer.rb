class Singer < ApplicationRecord

        validates :first_name, presence: true
        validates :last_name, presence: true
        validates :phone_number, presence: true, phone: true
        
        def phone_number=(str) 
            super(Phonelib.parse(str, "US").full_e164
            )
        end

        def display_phone_number
            Phonelib.parse(self.phone_number).full_national
        end

        def full_name 
            return "#{self.first_name} #{self.last_name}"
        end
end
