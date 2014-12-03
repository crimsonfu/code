# Goal

Use [jq](http://stedolan.github.io/jq/) to filter an array of objects and output one of their properties.

# Backstory

I needed to filter a large list of AMIs produced by the AWS CLI.  I wanted to get the ImageId of images of a particular host from before a certain date, for pruning.

# Challenge

Come up with jq commands to transform the given input into the desired output...

### Input

    {"Objects": [{"a": 1, "b": "xavier"}, {"a": 2, "b": 1}, {"a": 3, "b": "xylophone"}, {"a": 4, "b": "y"}, {"a": 5, "b": null}]}

### Output

    1
    3

# Outro

***Spoiler alert*** you can read the discussion that inspired this kata here in the [#crimsonfu logs](http://irclog.perlgeek.de/crimsonfu/2014-12-03#i_9755610).
