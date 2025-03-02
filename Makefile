ASM=nasm


all: clean test


test: main.bin
	qemu-system-x86_64 -hda $^


build: clean dist/os.img


dist/os.img: main.bin
	cp $^ $@
	truncate -s 4k $@


main.bin: main.asm
	$(ASM) -f bin -o $@ $^


clean:
	rm -f dist/os.img main.bin

