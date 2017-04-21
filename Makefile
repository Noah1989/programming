.PHONY: run clean

run: bin/hello
	bin/hello

clean:
	rm -rfv src bin 

src: lit/hello.lit
	mkdir -p src
	lit -odir src lit/hello.lit
	touch src

bin/hello: src
	mkdir -p bin
	${CC} -o bin/hello src/hello.c
