class Model < ActiveRecord::Base

  # informamos que a classe e abstrata
  self.abstract_class = true

  # permitimos que colunas possuam nomes de palavras reservadas
  self.inheritance_column = nil
  
  before_save { 
  	|m| m.id_ns = Digest::SHA1.hexdigest("#{SecureRandom.hex(6)}#{Time.now.to_i}#{SecureRandom.hex(6)}") 
  }

end
