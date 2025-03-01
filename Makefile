ASM=nasm


all: clean build


build: os.img


release: os.iso


debug: os.img
	qemu-system-x86_64 -hda $^


test: os.iso
	qemu-system-x86_64 dist/os.iso


os.iso: main.bin
	cp $^ iso/boot/os.bin
	grub-mkrescue -o dist/os.iso iso/ --modules="biosdisk part_msdos" --directory=/usr/lib/grub/i386-pc


os.img: main.bin
	cp $^ $@
	truncate -s 1440k $@


main.bin: main.asm
	$(ASM) -f bin -o $@ $^


clean:
	rm -f os.img main.bin iso/os.bin dist/os.iso

