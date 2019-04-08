# vim: sw=4 ts=4 sts=4 tw=0 et:
import cligen
import pbbam/pbbam

proc absolutize(positional: seq[string], outdir: string = "", update: bool = false): int =
  echo "absolutely!"
  return 0

proc filter(positional: seq[string]): int =
  echo "take a picture"
  return 0

echo "good"

when isMainModule:
  cligen.dispatchMulti(
    [absolutize,
      doc="""
Make the paths in an DataSet XML file absolute, optionally writing the new.
DataSet to a new location at the same time.""",
      short={
        "outdir": '\0', # suppress short-opts
        "update": '\0',
      },
      help={
        "positional": "infile",
        "update": "Update dataset metadata",
        "outdir": "Specify an optional output directory",
      },
    ],
    [filter,
      doc="""
Add filters to an XML file. Suggested fields: ['accuracy', 'ae', 'aend',
'alignedlength', 'as', 'astart', 'bc', 'bcf', 'bcq', 'bcr', 'bq', 'cx',
'length', 'mapqv', 'movie', 'n_subreads', 'pos', 'qend', 'qid', 'qname',
'qstart', 'readstart', 'rname', 'rq', 'tend', 'tstart', 'zm']. More expensive
fields: ['qs']. Multiple filters of different names will be ANDed together,
multiple filters of the same name will be ORed together, duplicating existing
requirements""",
      short={},
      help={
        "positional": "infile outfile filters [filters ...]",
      },
    ],
  )
#"min_idt": "minimum identity of the alignments used for correction (32-bit float)",
#[
usage: dataset absolutize [-h] [--outdir OUTDIR] [--update] infile

Make the paths in an DataSet XML file absolute, optionally writing the new
DataSet to a new location at the same time

positional arguments:
  infile           The XML file to absolutize

optional arguments:
  -h, --help       show this help message and exit
  --outdir OUTDIR  Specify an optional output directory (default: None)
  --update         Update dataset metadata (default: False)

usage: dataset filter [-h] infile outfile filters [filters ...]

Add filters to an XML file. Suggested fields: ['accuracy', 'ae', 'aend',
'alignedlength', 'as', 'astart', 'bc', 'bcf', 'bcq', 'bcr', 'bq', 'cx',
'length', 'mapqv', 'movie', 'n_subreads', 'pos', 'qend', 'qid', 'qname',
'qstart', 'readstart', 'rname', 'rq', 'tend', 'tstart', 'zm']. More expensive
fields: ['qs']. Multiple filters of different names will be ANDed together,
multiple filters of the same name will be ORed together, duplicating existing
requirements

positional arguments:
  infile      The XML file to filter
  outfile     The resulting DataSet XML file
  filters     The parameters, operators and values to filter (e.g. 'rq>0.85')

optional arguments:
  -h, --help  show this help message and exit
]#
