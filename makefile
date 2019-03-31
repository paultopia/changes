all: build

build:
	swift build -c release -Xswiftc -static-stdlib

testrun:
	.build/x86_64-apple-macosx/debug/changes
