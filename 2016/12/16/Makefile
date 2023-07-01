rent : rent.c
	cc rent.c -o rent

test : rent test.dat
	sed -n -e 's/\(< \)\(.*\)/\2/pw input.dat'    test.dat >/dev/null
	sed -n -e 's/\(> \)\(.*\)/\2/pw expected.dat' test.dat >/dev/null
	./rent <input.dat >result.dat
	diff expected.dat result.dat
	
