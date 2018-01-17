defmodule StructProvider.Example do
  require StructProvider, as: SP

  SP.from_map %{"hej" => "hopp", "pille" => true}
end
