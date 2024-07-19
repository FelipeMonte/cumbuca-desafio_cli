defmodule DesafioCli do
  @moduledoc """
  Ponto de entrada para a CLI.
  """

  @doc """
  A função main recebe os argumentos passados na linha de
  comando como lista de strings e executa a CLI.
  """

  def main(_args) do

    kings = ["Fel", "Lei", "Sel", "Isi", "Fel", "Sel", "Sel", "Isi", "Fel", "Sel"]
    # kings = []
    # kings = read_input(kings)

    new_kings = []
    new_kings = rename_kings(kings, new_kings)

    print_list(new_kings)
  end
  
  def read_input(kings) do
    name = IO.gets("Digite o nome do/da rei/rainha: ")
    if name != "\n" do
      kings = List.insert_at(kings, -1, name)
      read_input(kings)
    else
      kings
    end
  end

  def rename_kings(kings, new_kings) do
    frequencies = Enum.frequencies(kings)
    name = List.last(kings)
    name_frequency = Map.get(frequencies, name)
    # new_name = name <> " " <> Integer.to_string(name_frequency)
    new_name = name <> " " <> indo_arabic_to_roman(name_frequency, "", 12)

    new_kings = List.insert_at(new_kings, 0, new_name)

    remaining_kings = List.delete_at(kings, length(kings)-1)

    if length(remaining_kings) > 0 do
      new_kings = rename_kings(remaining_kings, new_kings)
    else
      new_kings
    end

  end

  def indo_arabic_to_roman(number, roman_number, index) do
    indo_arabic_base = [1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000]
    roman_base = ["I", "IV", "V", "IX", "X", "XL", "L", "XC", "C", "CD", "D", "CM", "M"]

    if index >= 0 do
      div = trunc(number / Enum.at(indo_arabic_base, index))
      mod = rem(number, Enum.at(indo_arabic_base, index))

      roman_number_patial = String.duplicate(Enum.at(roman_base, index), div)
        
      roman_number_final = roman_number <> "" <> roman_number_patial
      
      indo_arabic_to_roman(mod, roman_number_final, index-1)
    else
      roman_number
    end
  end

  def print_list(list) do
    for el <- list do
      IO.puts(el)
    end
  end

end
