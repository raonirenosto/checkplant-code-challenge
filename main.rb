require './miojo.rb'
require './ampulheta.rb'

class Main

  def start
    pegar_valores_iniciais
    tempo_decorrido_ate_desistir = 1000

    while tempo_decorrido_ate_desistir > @ampulheta1.tempo_total
      @ampulheta1.diminuir_1_minuto
      @ampulheta2.diminuir_1_minuto

      if @ampulheta1.acabou_areia?
        checar_tempo_cozimento(@ampulheta2, @miojo)
        @ampulheta1.virar_ampulheta
      end

      if @ampulheta2.acabou_areia?
        checar_tempo_cozimento(@ampulheta1, @miojo)
        @ampulheta2.virar_ampulheta
      end
    end

    nao_achou_tempo_exato()
  end

  def pegar_valores_iniciais
    puts "Digite o tempo de cozimento do miojo:"
    tempo_cozimento = gets.chomp.to_i

    puts "Digite o tempo da ampulheta 1:"
    capacidade_ampulheta1 = gets.chomp.to_i

    puts "Digite o tempo da ampulheta 2:"
    capacidade_ampulheta2 = gets.chomp.to_i

    @miojo = Miojo.new(tempo_cozimento)
    @ampulheta1 = Ampulheta.new(capacidade_ampulheta1)
    @ampulheta2 = Ampulheta.new(capacidade_ampulheta2)
  end

  def checar_tempo_cozimento ampulheta, miojo
    if ampulheta.igual_tempo_restante? miojo.tempo_cozimento
      tempo_exato = ampulheta.tempo_total + miojo.tempo_cozimento
      achou_tempo_exato(tempo_exato)
    end
  end

  def achou_tempo_exato tempo_exato
    puts "O tempo total para conseguir cozinhar o miojo é de #{tempo_exato} minutos"
    exit
  end

  def nao_achou_tempo_exato 
    puts "Não é possível cozinhar o miojo com as duas ampulhetas informadas"
  end
end

Main.new.start()