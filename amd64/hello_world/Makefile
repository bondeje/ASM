all: ../string.s terminal.s hello_world.s
	$(CC) ../string.s terminal.s hello_world.s -o hello_world

terminal.s:
	gcc -E -P -xc ../terminal.hs -o $@

clean:
	rm terminal.s hello_world
