# simplepay

Exercise.

## Why Ruby?

Metaprogramming is awesome. :bomb:

## Requirements

- Ruby 2.x

## Usage

```bash
$ git clone git@github.com:rainerborene/simplepay.git
$ ./bin/simplepay
```

## Design Decisions

- using `to_s` and regular expression on `CreditCard#valid?` method to validate
  length and numeric type. you could use logarithm method to get the number of
  digits as an alternative. I didn't benchmark both methods to see which one is
  more efficient yet.

- `autoload` modules is a best practice on large ruby libraries.

- version control software from day zero. `git` is all about communication
  not only file versioning.

- easy distribution on RubyGems with the current skeleton.

- declined charges raises `CardError` exception. you can rescue and ignore it.

- no external dependencies.

## Spec

```bash
$ rake test
```
