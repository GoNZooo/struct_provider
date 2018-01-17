# StructProvider

## Motivation

I wanted to see what I'd have to do to not have to care at all about defining
structs for consumption of some API. I ended up with this. Note that I don't 
think this is all that useful in practice. These are **not** as useful as
something like type providers in F#. 

## Usage

```elixir
defmodule StructProvider.GithubExample do
  require StructProvider, as: SP

  SP.from_url "https://api.github.com/users/gonzooo"
end
```

will produce a struct containing the following:

```elixir
iex(1)> %StructProvider.GithubExample{}
%StructProvider.GithubExample{
  avatar_url: "",
  bio: "",
  blog: "",
  company: nil,
  created_at: "",
  email: nil,
  events_url: "",
  followers: 0,
  followers_url: "",
  following: 0,
  following_url: "",
  gists_url: "",
  gravatar_id: "",
  hireable: false,
  html_url: "",
  id: 0,
  location: "",
  login: "",
  name: "",
  organizations_url: "",
  public_gists: 0,
  public_repos: 0,
  received_events_url: "",
  repos_url: "",
  site_admin: false,
  starred_url: "",
  subscriptions_url: "",
  type: "",
  updated_at: "",
  url: ""
}
```

```elixir
defmodule StructProvider.JsonExample do
  require StructProvider, as: SP

  SP.from_json "{\"hejban\":\"hopp\", \"lojban\":\"true\"}"
end
```

will produce a struct that looks as follows:

```elixir
iex(2)> %StructProvider.JsonExample{}
%StructProvider.JsonExample{hejban: "", lojban: ""}
```