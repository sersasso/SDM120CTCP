CC = gcc
#CFLAGS  = -O2 -Wall -g -I/usr/local/include/modbus
CFLAGS  = -O2 -Wall -g `pkg-config --cflags libmodbus`
#LDFLAGS = -O2 -Wall -g -L/usr/local/lib -lmodbus
LDFLAGS = -O2 -Wall -g `pkg-config --libs libmodbus`

SDM = sdm120ctcp
%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

${SDM}: sdm120ctcp.o 
	$(CC) -o $@ sdm120ctcp.o $(LDFLAGS)
	chmod 4711 ${SDM}

strip:
	strip ${SDM}

clean:
	rm -f *.o ${SDM}

install: ${SDM}
	install -m 4711 $(SDM) /usr/local/bin

uninstall:
	rm -f /usr/local/bin/$(SDM)
