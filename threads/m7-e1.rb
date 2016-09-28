# A classe Job inicializa jobs que levam aproximadamente 1 segundo para rodar.
class Job
  DIGITS = []
  def initialize(digit)
    @digit = digit
  end

  def run
    DIGITS << @digit
    sleep(1)
    print "Processado: #{@digit}"
  end
end

# Inicializa 10 jobs com os valores: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
jobs = []
10.times do |i|
  jobs << Job.new(i)
end

timer_start = Time.now

# O programa atual executa em aproximadamente 10 segundos, pois sÃ£o executados
# 10 jobs sequencias com duraÃ§Ã£o de 1 segundo cada.

# O seu trabalho Ã© modificar o cÃ³digo abaixo para que este programa execute
# em aproximadamente 1 segundo.

# Executa os jobs

threads = []
jobs.each do |job|
  threads << Thread.new { job.run }
end

threads.each { |thr| thr.join }

# Imprime o tempo de execuÃ§Ã£o do programa
EXECUTION_TIME = Time.now - timer_start
puts "O programa levou #{EXECUTION_TIME} segundos para executar"