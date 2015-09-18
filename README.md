# Amethyst examples
They will be updated with new Amethyst release.
Application examples for [Amethyst web-framework](https://github.com/Codcore/amethyst)

## Installation

Create a directory from scratch:

```
mkdir my-amethyst
cd my-amethyst
```

Create a `Projectfile`, in which add:

```crystal
deps do
  github "spalger/crystal-mime"
  github "Codcore/amethyst"
  github "Codcore/amethyst-examples"
end
```

and run:

```
crystal deps
```

to install packages.

## Start Server

Start server from the root of the project directory:

```
crystal libs/amethyst-examples/test.cr
```

Thus the server should be listening to `localhost:8080`.

## Development

Feel free to add your own apps written in Amethyst

## Contributing

1. Fork it ( https://github.com/[your-github-name]/examples/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [Codcore](https://github.com/Codcore) codcore - creator, maintainer
