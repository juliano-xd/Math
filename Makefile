install:
	nasm -O3 ./math.asm -f elf64
	ar rcs libmath.a ./math.o
	mv -f libmath.a /usr/local/lib/
	cp -f -d ./math.h /usr/include/math.h
	ldconfig
