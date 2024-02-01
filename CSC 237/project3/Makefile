a.out: main.cpp Token.o
	g++ main.cpp Token.o

debug: main.cpp Token.o
	g++ main.cpp Token.o
	./a.out -g

clean:
	rm *~
	rm a.out

test: main.cpp Token.o
	@echo "Test choice 1 with 2 3 +"
	@./a.out -t < data/input1a
	@echo "Test choice 1 with 7 3 12 - 5 * +"
	@./a.out -t < data/input1b
	@echo "Test choice 1 with 3 4 + 5 - 7 8 * +"
	@./a.out -t < data/input1c
	@echo ""
	@echo "Test choice 2 with 3 - 4 + 5"
	@./a.out -t < data/input2a
	@echo "Test choice 2 with 120 / 4 / 2 - (3 + 5) * 7"
	@./a.out -t < data/input2b
	@echo "Test choice 2 with 2 + ((3 + 4) * 6 - 10) / 4"
	@./a.out -t < data/input2c
	@echo ""
	@echo "Test choice 3 with 3 - 4 + 5"
	@./a.out -t < data/input3a
	@echo "Test choice 3 with 120 / 4 / 2 - (3 + 5) * 7"
	@./a.out -t < data/input3b
	@echo "Test choice 3 with  2 + ((3 + 4) * 6 - 10) / 4"
	@./a.out -t < data/input3c
