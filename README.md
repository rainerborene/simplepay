# simplepay

exercise.

## why ruby?

metaprogramming is awesome. :bomb:

## requirements

- Ruby 2.x

## usage

clone this repository to your local machine.

```bash
$ git clone git@github.com:rainerborene/simplepay.git
```

you can pass data using space delimited arguments, via stdin or a file path.

```bash
$ simplepay Add Jane 4111111111111111 $1000 \
            Add Lisa 5454545454545454 $3000 \
            ...
```

```bash
$ cat data.txt | simplepay
```

```bash
$ simplepay data.txt
```

## design decisions

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

## extra mile

- persistent objects using ruby marshalling

## spec

```bash
$ rake test
```
