# Open and Close jot Notepads

- `jot_open()` and `jot_activate()` opens an existing notepad and sets
  it to active.

- `jot_current()` and `jot_active()` return the path to the current
  notepad.

- `jot_close()` and `jot_deactivate()` closes the open notepad, if there
  is one.

## Usage

``` r
jot_open(pad)

jot_activate(pad)

jot_active()

jot_current()

jot_close()

jot_deactivate()
```

## Arguments

- pad:

  path to file to open

## Value

path to pad, invisibly

## Examples

``` r
tf <- tempfile()
jot_new_pad(tf)
jot_open(tf)
jot_active()
#> [1] "/tmp/RtmpES43o9/file19cb6cba974e.yaml"
jot_current()
#> [1] "/tmp/RtmpES43o9/file19cb6cba974e.yaml"
jot_close()
jot_active()
#> [1] ""
```
