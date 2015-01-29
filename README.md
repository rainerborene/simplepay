# simplepay

Proof of concept.

## Why Ruby?

Ruby is the language I am most comfortable with.

## Requirements

- Ruby 2.x

## Usage

Clone this repository to your local machine.

```shell
$ git clone git@github.com:rainerborene/simplepay.git
```

Choose which method you want to pass arguments:

```shell
$ bin/simplepay Add Jane 4111111111111111 \$1000 
$ bin/simplepay Add Lisa 5454545454545454 \$3000 
```

```shell
$ bin/simplepay spec/fixtures.txt
```

```shell
$ cat spec/fixtures.txt | bin/simplepay
```

## Design Decisions

- using `to_s` and regular expression on `Card#valid?` method to validate
  length and numeric type. you could use logarithm method to get the number of
  digits as an alternative. I didn't benchmark both methods to see which one is
  more efficient yet.

- `autoload` modules is a best practice on large ruby libraries.

- version control software from day zero. `git` is all about communication
  not only file versioning.

- easy distribution on RubyGems with the current skeleton.

- declined charges raises `CardError` exception. you can rescue and ignore it.

- no external dependencies.

- no documentation. code and specs are self explaining.

- well written README does matter.

- persistence using ruby marshaller **(extra mile)**

## Spec

```shell
$ rake test
```
