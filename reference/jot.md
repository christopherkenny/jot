# Jot Down a Note

Jot Down a Note

## Usage

``` r
jot(
  note,
  name,
  overwrite = FALSE,
  user = get_jot_user(),
  time = get_sys_time(),
  pad = jot_active()
)

write_jot(
  note,
  name,
  overwrite = FALSE,
  user = get_jot_user(),
  time = get_sys_time(),
  pad = jot_active()
)
```

## Arguments

- note:

  data to save. required.

- name:

  character, name of data. required.

- overwrite:

  logical, default is FALSE. If a note of the same name exists, should
  it be overwritten?

- user:

  name of user. default is
  [`get_jot_user()`](http://christophertkenny.com/jot/reference/get_jot_user.md).

- time:

  system time. default is
  [`get_sys_time()`](http://christophertkenny.com/jot/reference/get_sys_time.md).

- pad:

  path to file of pad to write to. default is
  [`jot_active()`](http://christophertkenny.com/jot/reference/jot_open.md).

## Value

path to pad, invisibly

## Examples

``` r
tf <- tempfile()
jot_new_pad(tf)
jot_activate(tf)
jot(3, 'example')
```
