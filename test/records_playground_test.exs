defrecord Address,
  line1: "",
  line2: "",
  state: "AL",
  country: "USA"

defmodule AddressPrinter do
  def print(Address[line1: line1, state: "AL"]) do
    "From my home state, hello to #{line1}"
  end
  def print(Address[line1: line1]) do
    "hello to #{line1}"
  end
end

defmodule RecordsPlaygroundTest do
  use ExUnit.Case

  test "record definitions return a tuple" do
    assert {:module, NewRecord, _, nil} = defrecord NewRecord, line1: nil, line2: nil, state: "AL", country: "USA"
  end

  test "records can be used for pattern matching" do
    address = Address.new state: "MO"
    Address[state: state] = address
    assert state == "MO"
  end

  test "records allow default values" do
    address = Address.new
    Address[state: state] = address
    assert state == "AL"
  end

  test "records can be pattern matched on for function clauses" do
    home_address = Address.new line1: "Foo", state: "AL"
    away_address = Address.new line1: "Bar", state: "MO"
    assert "From my home state, hello to Foo" == AddressPrinter.print(home_address)
    assert "hello to Bar" == AddressPrinter.print(away_address)
  end
end
