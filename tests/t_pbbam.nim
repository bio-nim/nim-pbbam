# vim: sw=4 ts=4 sts=4 tw=0 et:
# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

#from pbbam/pbbam import nil
import unittest
import pbbam/pbbam

test "sample":
    check 10 == 10
