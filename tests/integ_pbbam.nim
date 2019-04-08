# vim: sw=4 ts=4 sts=4 tw=0 et:

proc main =
    echo "hi"
    #if true:
    #  raise newException(OSError, "the request to the OS failed")
    var s: std_string
    s = constructStdString("foo")
    var q: string = $s.c_str()
    echo "then:", q
    s = constructStdString(bam)
    echo "now:", q
    var r = constructBamReader(s)
    stderr.writeLine("Constructed?")
    echo "Filename:", $r.Filename.c_str()
    var h = r.Header()
    let bout = constructStdString("foo.bam")
    var w = constructBamWriter(bout, h)
    var ds_string1 = constructStdString("ds1.xml")
    var ds_string2 = constructStdString("ds2.xml")
    #var d = constructDataSet(ds_string1)
    var d = constructDataSet()
    d.Save(ds_string2)

try:
    main()
except Exception as ex:
    echo "trapped nim"
    echo "curr ex:", getCurrentExceptionMsg()
    if nil != ex:
        echo "ex:", repr(ex)
except StdCppImportedException as ex:
    echo "trapped cpp"
    echo "ex:", ex.what()
except:
    echo "trapped"

echo "dunn"
