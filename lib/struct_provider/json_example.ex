defmodule StructProvider.JsonExample do
  require StructProvider, as: SP

  SP.from_json "{\"hejban\":\"hopp\", \"lojban\":\"true\"}"
end
