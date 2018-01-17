defmodule StructProvider.GithubExample do
  require StructProvider, as: SP

  SP.from_url "https://api.github.com/users/gonzooo"
end
