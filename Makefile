.PHONY: run clean

run: bin/hello$(BIN_EXT)
	$(RUN) bin/hello$(BIN_EXT)

clean:
	rm -rfv src obj bin *.log

src: lit/hello.lit
	mkdir -p src
	lit -odir src lit/hello.lit
	touch src

src/hello.c: src

$(patsubst %,src/%,$(PLATFORM_SOURCES)): src

obj/%.o$(OBJ_EXT): src/%.c
	mkdir -p obj
	$(CC) $(CFLAGS) -o $@ -c $<

PLATFORM_OBJECTS=$(patsubst %.c,obj/%.o$(OBJ_EXT),$(PLATFORM_SOURCES))

bin/hello$(BIN_EXT): obj/hello.o$(OBJ_EXT) $(PLATFORM_OBJECTS)
	mkdir -p bin
	$(CC) $(CFLAGS) -o bin/hello$(BIN_EXT) obj/hello.o$(OBJ_EXT) $(PLATFORM_OBJECTS)
