# Copyright © 2014 Kosma Moczek <kosma@cloudyourcar.com>
# This program is free software. It comes without any warranty, to the extent
# permitted by applicable law. You can redistribute it and/or modify it under
# the terms of the Do What The Fuck You Want To Public License, Version 2, as
# published by Sam Hocevar. See the COPYING file for more details.

CFLAGS = -g -Wall -Wextra -std=c99 --static 
#CFLAGS = -g -Wall -Wextra -Werror -std=c99 --static -Werror=unused-but-set-variable
CFLAGS += -D_POSIX_C_SOURCE=199309L -D_BSD_SOURCE -D_DEFAULT_SOURCE -D_DARWIN_C_SOURCE -I ../c-experimental-fa
LDLIBS =    --static -L ../c-experimental-fa -lblueforce -lm 
CC = gcc

all: binparse nmeaparse
	@echo "+++ All good."""

test: tests
	@echo "+++ Running Check test suite..."
	./tests

scan-build: clean
	@echo "+++ Running Clang Static Analyzer..."
	scan-build $(MAKE) tests

clean:
	$(RM) tests binparse nmeaparse *.o

tests: tests.o minmea.o
nmeaparse: nmeaparse.o minmea.o base32.o
binparse: binparse.o
tests.o: tests.c minmea.h
minmea.o: minmea.c minmea.h
base32.o: base32.c base32.h
binparse.o: binparse.c

.PHONY: all test scan-build clean
