class Product
    attr_reader :title, :price, :manufacturer
    attr_accessor :barcode, :code

    def initialize hash
        self.title = hash['title']
        self.price = hash['price']
        self.manufacturer = hash['manufacturer_code']
        @barcode = hash['barcode']
        @code = generate_control_code() 
    end
    
    def title=(new_title)
        if new_title.nil? || new_title.empty? 
            fail SimpleStore::Error, "O título do produto não pode ser vazio" 
        else 
            @title = new_title
        end
    end

    def price=(new_price)
        if new_price.nil? || new_price < 0.0
            fail SimpleStore::Error, 'O preço do produto deve ser >= 0.0'
        else  
            @price = new_price
        end
    end
    
    def manufacturer=(code)
        if SimpleStore::AUTHORIZED_MANUFACTURERS.has_value? (code)
            @manufacturer = SimpleStore::AUTHORIZED_MANUFACTURERS.key(code)
        else
             fail SimpleStore::Error, "O fabricante não está autorizado"
        end
    end
    
    private
    def generate_control_code
        @id_control = "#{SimpleStore::PRODUCT_TYPES[:Product]}--#{SimpleStore::AUTHORIZED_MANUFACTURERS.fetch @manufacturer}--#{@barcode}"
    end
    
end
