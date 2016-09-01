class FreshProduct < Product
    include DiscountEligible
    attr_reader :expiration_date
    
    def initialize hash
        super(hash)
        self.expiration_date = hash['expiration_date']
    end
    
    def expiration_date=(new_expiration_date)
        if new_expiration_date.nil? || Date.parse(new_expiration_date) < Date.today
            fail SimpleStore::Error, 'O produto não pode estar vencido'
        else
            @expiration_date = new_expiration_date
        end
    end
end