all: ../string.s terminal.s hello_world.s
	$(CC) ../string.s terminal.s hello_world.s -o hello_world
	rm terminal.s

terminal.s:
	gcc -E -P -xc ../terminal.hs -o $@
