#EXTRA+=--d:nativeStacktrace
#EXTRA+=--debugger:native
#EXTRA+=--define:bam=foo
#EXTRA+=--verbosity:2

run:
	./pbdataset -h
	./pbdataset absolutize --help
	./pbdataset filter --help
build:
	nimble build --debug
integ:
	nim cpp -r tests/integ_pbbam.nim
test:
	#nimble test --debug # https://github.com/nim-lang/nimble/issues/631
	nim cpp tests/t_pbbam.nim
	${MAKE} retest
retest:
	./tests/t_pbbam
dataset.exe: dataset.nim pbbam.nim
	nim cpp -o:dataset.exe dataset.nim
clean:
	rm -f pbdataset
distclean:
	git clean -xdf .
.PHONY: tests
