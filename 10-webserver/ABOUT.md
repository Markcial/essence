# Chapter 10
## Webserver

The library used for the website creation is the [phoenix library](http://www.phoenixframework.org/).

Once the phoenix package installation is completed you can create a new phoenix project via the `mix phoenix.new project_name`.

The current project is created without the database layer done via the [ecto library](https://github.com/elixir-ecto/ecto), this is achieved via the command line parameter `--no-ecto`.

The phoenix webserver can be started via the `iex -S mix phoenix.server` command. Once ready will be listening on localhost for incoming connections.
