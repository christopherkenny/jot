# Read in all values from a jot notepad

Read in all values from a jot notepad

## Usage

``` r
jot_skim(pad = jot_active())
```

## Arguments

- pad:

  path to file to open

## Value

value specified or list of all values

## Examples

``` r
tf <- tempfile()
jot_new_pad(tf)
jot_activate(tf)
jot('ex_val', 'ex')
jot_skim()
#> $ex
#> [1] "ex_val"
#> 
```
