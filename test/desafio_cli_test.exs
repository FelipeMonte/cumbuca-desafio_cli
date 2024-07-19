defmodule DesafioCliTest do
  use ExUnit.Case
  doctest DesafioCli

  test "conversion to roman" do
    assert DesafioCli.indo_arabic_to_roman(10) == "X"
  end

  test "conversion to roman 2" do
    assert DesafioCli.indo_arabic_to_roman(156) == "CLVI"
  end

  test "renaming kings" do
    assert DesafioCli.rename_kings(["Fel", "Lei", "Sel", "Isi", "Fel", "Sel", "Sel", "Isi", "Fel", "Sel"], []) == ["Fel I", "Lei I", "Sel I", "Isi I", "Fel II", "Sel II", "Sel III", "Isi II", "Fel III", "Sel IV"]
  end

  test "renaming kings 2" do
    assert DesafioCli.rename_kings(["Eduardo", "Maria", "Daniel", "Eduardo"], []) == ["Eduardo I", "Maria I", "Daniel I", "Eduardo II"]
  end

  test "renaming kings 3" do
    assert DesafioCli.rename_kings(["João", "João", "João", "João"], []) == ["João I", "João II", "João III", "João IV"]
  end

end
