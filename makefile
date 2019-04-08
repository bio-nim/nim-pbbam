#EXTRA+=--d:nativeStacktrace
EXTRA+=--debugger:native
#EXTRA+=--define:bam=foo
EXTRA+=--verbosity:2

test: dataset.exe
	./dataset.exe absolutize --help
	./dataset.exe filter --help
	#./dataset.exe absolutize
	#./dataset.exe filter
test-nimble:
	nimble testabs --debug
	nimble testfilt --debug
build:
	nimble build --debug
dataset.exe: dataset.nim pbbam.nim
	nim cpp ${EXTRA} -o:dataset.exe dataset.nim
go:
	#nim cpp --cc:gcc -r pbbam.nim
	rm -f pbbam.exe
	nim cpp ${EXTRA} -o:pbbam.exe pbbam.nim
	./pbbam.exe
clean:
	git clean -xf .
