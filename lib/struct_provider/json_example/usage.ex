defmodule StructProvider.JsonExample.Usage do
  def show(%StructProvider.JsonExample{hejban: hejban, lojban: lojban}) do
    "<StructProvider.JsonExample: hejban=#{hejban} lojban=#{lojban}"
  end
end
