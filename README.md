[![Build Status](https://travis-ci.org/racker/cookbook-cleanup.svg)](https://travis-ci.org/racker/cookbook-cleanup)
[![Chef cookbook](https://img.shields.io/cookbook/v/cleanup.svg)](https://supermarket.chef.io/cookbooks/cleanup)

Description
===========

This cookbook creates a `cleanup` resource to handle the cleanup of arbitrary paths based on number of files or last modified dates.

Attributes
==========

- `name` - String representing a path glob so wildcards are totally fine.
- `dry_run` - `true`/`false` Defaults to `false`. If `true` will disable actual file operations.`
- `files` - `true`/`false` Defaults to `true`. If false will ignore files during cleanup.
- `directories` - `true`/`false` Defaults to `true`. If false will ignore directories during cleanup.
- `sort_by` - `:atime`/`:ctime`/`:mtime` Defaults to `:mtime`. Sort the files to be deleted by their (a)ccess, (c)reate or (m)odified time.

`keep_last` and `older_than` are mutally exclusive since I can't think of any way combining them makes sense.

- `keep_last` - Takes an integer. Will keep that many files starting from the most recent.
- `older_than` - Takes a hash that looks like `{:time_increment => time_quantity}`. Increments can be one of [:minutes, :hours, :days, :weeks] (months are hard).

Usage
=====

Include the cookbook then just call the `cleanup` resource from your recipe like this:

### Keep the most recent 5 files
```ruby
cleanup "/your/path/here/*" do
  keep_last 5
end
```
### Delete files older than 1 week
```ruby
cleanup "/your/path/here/*" do
  older_than :weeks => 1
end
```
