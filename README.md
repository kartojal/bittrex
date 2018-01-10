# ExBittrex

## Installation

Add `exbittrex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:exbittrex, "~> 0.5"}]
end
```

## Usage

Add credentials from ExBittrex. To manage your API keys please goto
`Settings -> Manage API Keys` on ExBittrex.

```elixir
# config/config.exs
config :exbittrex,
  credentials: [
    api_key: "",
    api_secret: ""
  ]
```

From now on, just check the available modules and functions so you can find
the data that you need. The module and function are self descriptive but if you
have any feedback open a PR and we add some documentation.
