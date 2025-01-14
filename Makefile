compile-linux:
	echo "Compiling for Linux OS"
	go env -w GOOS=linux
	go env -w CGO_ENABLED=1
	go build -o linux1/rubixgoplatform
compile-windows:
	echo "Compiling for Windows OS"
	go env -w GOOS=windows
	go env -w CGO_ENABLED=1
	go build -o windows/rubixgoplatform.exe

compile-mac:
	echo "Compiling for MacOS arm64"
	go env -w GOOS=darwin
	go env -w GOARCH=arm64
	go env -w CGO_ENABLED=1
	go build -o mac/rubixgoplatform

clean:
	rm -f linux/rubixgoplatform windows/rubixgoplatform.exe mac/rubixgoplatform

all: compile-linux compile-windows compile-mac