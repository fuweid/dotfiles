# Wei does dotfiles [![Build Status](https://travis-ci.org/fhfuwei/dotfiles.svg?branch=master)](https://travis-ci.org/fhfuwei/dotfiles)

I was sick and really really tired of setting up the brew new environment.

You might heard about `dotfiles`. Yes. These are mine.

## About Hierarchy

Everyone has different tastes.

But it doesn't mean that you don't need to manage those `dotfiles`.

I split those dotfiles into different modules, as [@holman](https://github.com/holman/dotfiles) mentions, this is **topic-centric**.

It's easy to add and organize new area in this repository if you follow the rules.

## How to setup

I use the setup script to sync `dotfiles` between multiple machines, or docker containers.

However, I suggest that you should fully understand **what the setup script does** before you run.

DON'T just follow the commands. **Seriously**, DON'T.

```
git clone https://github.com/fhfuwei/dotfiles ~/.dotfiles
cd ~/.dotfiles
make
```

## Acknowledgements

Inspired by [@holman](https://github.com/holman/dotfiles) and [@alrra](https://github.com/alrra/dotfiles).

## License

[MIT license](LICENSE)
