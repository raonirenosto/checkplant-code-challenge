class Ampulheta
  attr_reader :tempo_total

  def initialize(capacidade)
    @capacidade = capacidade
    @tempo_atual = capacidade
    @tempo_total = 0
  end

  def diminuir_1_minuto
    @tempo_atual = @tempo_atual - 1
    @tempo_total = @tempo_total + 1
  end

  def acabou_areia?
    @tempo_atual == 0
  end

  def igual_tempo_restante? tempo
    tempo == @tempo_atual
  end

  def virar_ampulheta
    @tempo_atual = @capacidade
  end
end