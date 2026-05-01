# Erase a Note

Erase a Note

## Usage

``` r
jot_erase(name, pad = jot_active())
```

## Arguments

- name:

  character, name of note to erase. required.

- pad:

  path to file of pad to write to. default is
  [`jot_active()`](http://christophertkenny.com/jot/reference/jot_open.md).

## Value

path to pad, invisibly

## Examples

``` r
tf <- tempfile()
jot_new_pad(tf)
jot(3, 'example')
jot_erase('example')
```
