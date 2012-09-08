## Goal

Understand what autovivification is and why it's useful. :)

## Backstory

This kata started with [pdurbin][] picking up an existing Ruby script and trying to figure out how to build a hash of arrays.

It lead to a discussion of autovivification.

> "Autovivification is a distinguishing feature of the Perl programming language involving the dynamic creation of data structures." -- http://en.wikipedia.org/wiki/Autovivification

In short, pdurbin likes the way Perl lets him define a scalar and then throw whatever data he wants into it.

## Challenge

Write some code that takes `t/input.txt` as input and outputs JSON.  You don't have to pretty print your JSON as the test harness will do that for you (by running it through `python -m json.tool`).

See `t/expected.txt` for how the pretty printed JSON should look.

Perl's `prove` command can be used to compare expected output to the output of submitted solutions.  When all solutions pass, the output looks like this:

    [pdurbin@tabby autovivification]$ prove -v
    t/go.t .. 
    1..2
    ok 1 - pdurbin-perl
    ok 2 - pdurbin-ruby
    ok
    All tests successful.
    Files=1, Tests=2,  0 wallclock secs ( 0.02 usr  0.00 sys +  0.09 cusr  0.02 csys =  0.13 CPU)
    Result: PASS
    [pdurbin@tabby autovivification]$ 

## Outro

The bulk of the discussion has taken place here so far:

* http://irclog.perlgeek.de/crimsonfu/2012-09-06#i_5968059
* http://irclog.perlgeek.de/crimsonfu/2012-09-07#i_5969519

See also:

* http://blog.luckyus.net/2008/11/13/a-hash-of-arrays-and-a-hash-of-hashes-in-ruby/
* http://t-a-w.blogspot.com/2006/07/autovivification-in-ruby.html

[pdurbin]: http://greptilian.com
