CC = g++
CFLAGS = -O3 -std=c++14 -static -static-libgcc -static-libstdc++

.PHONY: all runq clean

all: runq

runq: llama2_decoder_sw_emulator.cpp
	$(CC) $(CFLAGS) -o runq.exe llama2_decoder_sw_emulator.cpp

clean:
	rm -f runq.exe
