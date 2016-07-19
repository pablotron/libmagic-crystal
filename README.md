# libmagic-crystal

Crystal bindings for libmagic.

## Installation


Add this to your application's `shard.yml`:

```yaml
dependencies:
  libmagic-crystal:
    github: pablotron/libmagic-crystal
```


## Usage


```crystal
require "libmagic-crystal/magic"

# create magic bindings
magic = Magic::Magic.new

# get mime type of file
mime_type = magic.file("/path/to/some/file")
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it ( https://github.com/[your-github-name]/libmagic-crystal/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [pablotron](https://github.com/pablotron) Paul Duncan - creator, maintainer
