defmodule StructProvider do
  @moduledoc """
  StructProvider is a library for turning input data into structs.
  """
  require Logger

  @doc """
  `from_map` turns a map into a struct
  """
  defmacro from_map({:%{}, _, kvs}) do
    quote bind_quoted: [keys: keyify(kvs)] do
      defstruct keys
    end
  end

  defmacro from_map(%{} = map) do
    quote bind_quoted: [keys: keyify(map)] do
      defstruct keys
    end
  end

  defmacro from_url(url) do
    Application.ensure_all_started(:hackney)
    %HTTPoison.Response{body: data} = HTTPoison.get! url
    map = Poison.decode!(data)
    quote do
      StructProvider.from_map unquote(map)
    end
  end

  @doc """
  `from_json` takes a JSON-encoded structure and creates a struct from it.
  """
  defmacro from_json(data) do
    map = Poison.decode!(data)
    quote do
      StructProvider.from_map(unquote(map))
    end
  end

  defp keyify(data) do
    data
    |> Enum.map(&keyify_element/1)
  end

  defp keyify_element({k, %{}}) do
    {String.to_atom(k), %{}}
  end

  defp keyify_element({k, nil}) do
    {String.to_atom(k), nil}
  end

  defp keyify_element({k, v}) when is_binary(v) do
    {String.to_atom(k), ""}
  end

  defp keyify_element({k, v}) when is_integer(v) do
    {String.to_atom(k), 0}
  end

  defp keyify_element({k, v}) when is_boolean(v) do
    {String.to_atom(k), false}
  end

  defp keyify_element({k, [_ | _]}) do
    {String.to_atom(k), []}
  end
end
