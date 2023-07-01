test: bowling test.txt
	sed -n -e 's/\(<- \)\(.*\)/\2/pw input.dat'     test.txt >/dev/null
	sed -n -e 's/\(-> \)\(.*\)/\2/pw expected.dat'      test.txt >/dev/null
	./bowling <input.dat >result.dat
	diff expected.dat result.dat

bowling: bowling.c game.c game.h
	cc bowling.c game.c -o bowling

clean:
	rm *.dat
	rm bowling

