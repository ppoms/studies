class DigitalProduct < Product
    include DiscountEligible
    attr_reader :expiration_date, :url

    def initialize hash
        super(hash)
        self.expiration_date = hash['expiration_date']
        self.url = hash['url']
    end
    
    def expiration_date=(new_expiration_date)
        if new_expiration_date.nil? || Date.parse(new_expiration_date) < Date.today
            fail SimpleStore::Error, 'O produto não pode estar vencido'
        else
            @expiration_date = new_expiration_date
        end
    end
    
    def url=(new_url)
        if new_url[0..3] != "http"
            fail SimpleStore::Error, 'A URL do produto deve ser válida'
        else
            @url = new_url
        end
    end
end