all: ../string.s terminal.s jump.s hello_world.s
	$(CC) ../string.s terminal.s jump.s hello_world.s -o hello_world

jump.s:
	$(CC) -E -P -xc -DOS_NAME=$$(uname -o | sed -r 's/[/]/_/g') ../jump.hs -o $@

terminal.s:
	$(CC) -E -P -xc -DOS_NAME=$$(uname -o | sed -r 's/[/]/_/g') ../terminal.hs -o $@

clean:
	rm -f terminal.s hello_world jump.s
