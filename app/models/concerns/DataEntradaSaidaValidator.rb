class DataEntradaSaidaValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, _value)
    data_entrada = record.send(:data_entrada) # Acesse a data de entrada
    data_saida = record.send(:data_saida)     # Acesse a data de saída

    return unless data_entrada && data_saida && data_entrada < data_saida

    record.errors.add(attribute, 'Data de entrada deve ser maior que a data de saída')
  end
end

