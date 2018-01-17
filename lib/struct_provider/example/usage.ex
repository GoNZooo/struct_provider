defmodule StructProvider.Example.Usage do
  def show(%StructProvider.Example{hej: hej, pille: pille}) do
    "<StructProvider.Example hej=#{hej} pille=#{pille}>"
  end
end
