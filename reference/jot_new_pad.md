# Create new jot Notepad

Create new jot Notepad

## Usage

``` r
jot_new_pad(pad = ".jot.yaml", title)

jot_new(pad = ".jot.yaml", title)
```

## Arguments

- pad:

  path to file to store new notepad.

- title:

  what to call the notepad. If not supplied, uses the name of the file.

## Value

path to file, invisibly

## Examples

``` r
tf <- tempfile()
jot_new_pad(tf)
```
