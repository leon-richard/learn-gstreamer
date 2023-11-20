CC = gcc
CFLAGS = -Wall -Wextra -std=c99
CFLAGS += `pkg-config --cflags --libs gstreamer-1.0`
PKGS := gstreamer-1.0
# CFLAGS := `pkg-config --cflags --libs $(PKGS)`

SRCS = $(wildcard *.c)
EXECS = $(patsubst %.c,%,$(SRCS))

all: $(EXECS)

%: %.c
	$(CC) $< -o $@ $(CFLAGS)

.PHONY: clean

clean:
	rm -f $(EXECS)
