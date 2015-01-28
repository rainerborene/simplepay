# simplepay

Exercise.

## Requirements

- Ruby 2.x

## Usage

```bash
$ git clone git@github.com:rainerborene/simplepay.git
$ ./bin/simplepay
```

## Design decisions

- use `to_s` and regular expression on `CreditCard#valid?` method to validate
  length and numeric type. an alternative is to use logarithm method to get
  the number of digits. I didn't benchmark both methods to see which one is more
  efficient yet.

- `autoload` modules is a best practice on large ruby libraries.

- control version software from day zero. `git` is all about communication
  not only file versioning.

- no external dependencies.

## Specs

```bash
$ rake test
```
