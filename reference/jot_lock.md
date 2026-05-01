# Lock or Unlock a jot Notepad

- `jot_lock()` locks a notepad so that `jot` will not write to it.

- `jot_unlock()` unlocks a notepad so that `jot` can write to it.

## Usage

``` r
jot_lock(pad = jot_active())

jot_unlock(pad = jot_active())
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
jot_activate(tf)
jot_lock()
jot_unlock()
```
