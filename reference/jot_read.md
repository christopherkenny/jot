# Read a jot notepad

Read a jot notepad

## Usage

``` r
jot_read(name, pad = jot_active())

read_jot(name, pad = jot_active())
```

## Arguments

- name:

  name of noteto read

- pad:

  path to file to open

## Value

value specified or all values

## Examples

``` r
tf <- tempfile()
jot_new_pad(tf)
jot_activate(tf)
jot(note = 'ex_note', name = 'ex_name')
jot_read()
#> $ex_name
#> [1] "ex_note"
#> 
jot_read('ex_name')
#> [1] "ex_note"
```
