# List out names of values in a jot notepad

List out names of values in a jot notepad

## Usage

``` r
jot_list(pad = jot_active())
```

## Arguments

- pad:

  path to notepad to open

## Value

vlist of names of values in notepad

## Examples

``` r
tf <- tempfile()
jot_new_pad(tf)
jot_activate(tf)
jot('ex_val', 'ex')
jot_list()
#> [1] "ex"
```
