# vim: sw=4 ts=4 sts=4 tw=0 et:
{.passC: "-std=c++14".}
{.passC: gorge("pkg-config --cflags pbbam").}
#{.passC: "-I../include/ -isystem/mnt/software/h/htslib/1.9/include -I/mnt/software/z/zlib/1.2.11/include".}
#{.passL: "-L/Users/cdunn2001/repo/gh/pbbam/.git/PREFIX/lib -L/usr/local/Cellar/htslib/1.9/lib -lpbbam -lhts".}
{.passL: gorge("pkg-config --libs pbbam").}
#{.passL: "/mnt/software/h/htslib/1.9/lib/libhts.so /mnt/software/z/zlib/1.2.11/lib/libz.so -L/localdisk/scratch/cdunn/repo/pbbam/build/src -lpbbam".}
#{.emit: """
##include <string>
##include <vector>
##include <cstring>
#
#char*  toCstring( const std::string& s );
#
#char*  toCstring( const std::string& s ) {
#  std::vector<char> v(s.size()+1);
#  memcpy( &v.front(), s.c_str(), s.size() + 1 );
#  return v.data();
#};
#""".}
import os
const
  pb = "libpbbam.dylib"
  bam {.strdefine.} = parentDir(currentSourcePath()) & "/../tests/data/long_reads.bam"

echo "bam:", bam
type
  StdCppImportedException* {.importc: "std::exception", header: "<exception>".} = object
  std_string* {.importc: "std::string", header: "<string>".} = object
  BamFile* {.header: "pbbam/BamFile.h", importcpp: "PacBio::BAM::BamFile".} = object
  BamReader* {.header: "pbbam/BamReader.h", importcpp: "PacBio::BAM::BamReader".} = object
  BamWriter* {.header: "pbbam/BamWriter.h", importcpp: "PacBio::BAM::BamWriter".} = object
  BamHeader* {.header: "pbbam/BamHeader.h", importcpp: "PacBio::BAM::BamHeader".} = object
  DataSet* {.header: "pbbam/DataSet.h", importcpp: "PacBio::BAM::DataSet".} = object
  PbiRawData* {.header: "pbbam/PbiRawData.h", importcpp: "PacBio::BAM::PbiRawData".} = object
  PbiRawBasicData* {.header: "pbbam/PbiRawData.h", importcpp: "PacBio::BAM::PbiRawBasicData".} = object

proc what*(this: StdCppImportedException): cstring {.importcpp: "const_cast<char*>(#.what())".}

proc constructStdString*(s: cstring): std_string {.importcpp: "std::string(@)", constructor, header: "<string>".}
proc c_str*(this: std_string): cstring {.importcpp: "const_cast<char*>(#.c_str())", header: "<string>".} # Remember to call "$s.c_str" immediately.

proc constructBamFile*(fn: std_string): BamFile {.importcpp: "PacBio::BAM::BamFile(@)", constructor}
proc Filename*(this: BamFile): std_string {.importcpp: "#.Filename()".}
proc PacBioIndexFilename*(this: BamFile): std_string {.importcpp: "#.PacBioIndexFilename()".}

proc constructBamReader*(fn: std_string): BamReader {.importcpp: "PacBio::BAM::BamReader(@)", constructor}
proc Filename*(this: BamReader): std_string {.importcpp: "#.Filename()".}
proc Header*(this: BamReader): BamHeader {.importcpp: "#.Header()".}

proc constructBamWriter*(fn: std_string, h: BamHeader): BamWriter {.importcpp: "PacBio::BAM::BamWriter(@)", constructor}

#proc constructBamHeader*(fn: std_string): BamHeader {.importcpp: "PacBio::BAM::BamHeader(@)", constructor}

proc constructDataSet*(): DataSet {.importcpp: "PacBio::BAM::DataSet()", constructor}
proc constructDataSet*(fn: std_string): DataSet {.importcpp: "PacBio::BAM::DataSet(@)", constructor}
proc Save*(this: DataSet, fn: std_string) {.importcpp: "#.Save(@)".}

proc constructPbiRawBasicData*(fn: std_string): PbiRawData {.importcpp: "PacBio::BAM::PbiRawData(@)", constructor}
#proc qStart*(this: PbiRawBasicData): seq[int32] {.importcpp: "#.qStart_".}

proc constructPbiRawData*(fn: std_string): PbiRawData {.importcpp: "PacBio::BAM::PbiRawData(@)", constructor}
proc Filename*(this: PbiRawData): std_string {.importcpp: "#.Filename()".}
proc NumReads*(this: PbiRawData): uint32 {.importcpp: "#.NumReads()".}
proc BasicData*(this: PbiRawData): PbiRawBasicData {.importcpp: "#.BasicData()".}
