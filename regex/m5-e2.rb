class M5E2
    def cpf_validation(cpf)
        !!(cpf =~ (/^\d{3}\.?\d{3}\.?\d{3}-?\d{2}$/))
    end
    
    def email_validation(email)
        !!(email =~ (/^[a-z0-9\._]+@[a-z0-9\.]+$/))
    end
    
    def price_validation(price)
        !!(price =~ (/(^R\$\s?\d{1,3}(\.\d{3})*\,\d{2}$|^U\$\s?\d{1,3}(\,\d{3})*\.\d{2}$)/))
    end
end