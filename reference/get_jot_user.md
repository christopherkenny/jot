# Get Current User

Get Current User

## Usage

``` r
get_jot_user(user = "")
```

## Arguments

- user:

  user to override get with. Default is `''`, where it checks options,
  then system info.

## Value

character

## Examples

``` r
get_jot_user()
#> [1] "runner"
get_jot_user(NA_character_)
#> [1] NA
```
