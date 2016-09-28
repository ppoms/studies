class M5E1
    NOTICIAS = "09:55 - [política] Prefeito da Krakosia é eleito o melhor para economia\n" +
                "10:14 - [cotidiano] Cachorro salva dono de assalto\n" +
                "11:01 - [esporte] Seleção local de golfe se classifica para mundial\n" +
                "11:36 - [esporte] João da Silva Sauro é cortado da seleção de golfe\n" +
                "13:19 - [economia] Desemprego sobe para 12% no último mês\n" +
                "14:55 - [política] Lei de incentivo ao esporte é aprovada no senado às 10:20\n" +
                "16:13 - [economia] Cotação do dólar sobe 5% em uma semana\n" +
                "19:26 - [esporte] Liga nacional de basquete tem recorde de público"
                
    def format_news            
        @news = NOTICIAS.scan(/^(\d{2}:\d{2}) - \[(.*)\](.*)/)
        @format_news = ""
        for i in 0..@news.size - 1
            @format_news += ("#{@news[i][1]}:#{@news[i][2]} (#{@news[i][0]})")
            if i != @news.size - 1
                @format_news += "\n"
            end
        end
        @format_news
    end

    def find_economy_dollar_news
        @find_economy_dollar_news = NOTICIAS.scan(/^\d{2}:\d{2}\s-\s\[economia\].*dólar/).size
    end
    
    def find_times
        @find_times = NOTICIAS.scan(/^\d{2}:\d{2}/)
    end
    
end