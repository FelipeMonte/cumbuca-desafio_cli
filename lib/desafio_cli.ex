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
    new_name = name <> " " <> Integer.to_string(name_frequency)

    new_kings = List.insert_at(new_kings, 0, new_name)

    remaining_kings = List.delete_at(kings, length(kings)-1)

    if length(remaining_kings) > 0 do
      new_kings = rename_kings(remaining_kings, new_kings)
    else
      new_kings
    end

  end

  def print_list(list) do
    for el <- list do
      IO.puts(el)
    end
  end

end
