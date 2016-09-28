#1 
ip_list = Hash.new
File.foreach("/home/ubuntu/workspace/ep-exercicios/m5/e3/log-do-servidor.log") do |line|
    ip = line.scan(/^.*\-\s(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})\:/)
    if ip_list.has_key? "#{ip[0][0]}"
        ip_list[ip[0][0]] += 1
    else
        ip_list[ip[0][0]] = 1
    end
end
higher = 0
ip_list.each_value do |value|
    if value > higher
        higher = value
    end
end
File.open("./m5-e3.txt", 'a+') { |f| f.puts("#{ip_list.key(higher)}") }

#2
req_x = 0
file = File.open("/home/ubuntu/workspace/ep-exercicios/m5/e3/log-do-servidor.log", "r")
file.each do |line|
    if line.match(/^.*\:\s(ERRO|ALERTA)\s\|/)
        req_x += 1
    end
end
file.close
File.open("./m5-e3.txt", 'a+') { |f| f.puts("#{req_x}") }

#3
name = []
file = File.open("/home/ubuntu/workspace/ep-exercicios/m5/e3/log-do-servidor.log", "r")
file.each do |line|
    if line.match(/^2016-07-21\s00:17:50.+\/(.+\.\w+)/)
        name = line.scan(/^2016-07-21\s00:17:50.+\/(.+\.\w+)/)
    end
end
file.close
File.open("./m5-e3.txt", 'a+') { |f| f.puts("#{name[0][0]}") }

#4
a = []
File.foreach("/home/ubuntu/workspace/ep-exercicios/m5/e3/log-do-servidor.log") do |line|
    if line.match(/^2016-07-31\s06:11:20.*\((.*)\)$/)
        a = line.scan(/^2016-07-31\s06:11:20.*\((.*)\)$/)
    end
end
File.open("./m5-e3.txt", 'a+') { |f| f << ("#{a[0][0]}") }
