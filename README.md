# simplepay

A simple command-line demo.

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

## Spec

```shell
$ rake test
```
