obs.x: test.f95
	gfortran-5 -o obs.x test.f95 -Wall -g

test: obs.x
	echo -e '\n'
	./obs.x -i input_file_test.txt -o output_file_test.bin -s coloumns_to_keep_string

clean:
	rm -f obs.x
