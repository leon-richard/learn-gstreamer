CC = gcc
CFLAGS := -Wall -Wextra -std=c11 -g
# CFLAGS += `pkg-config --cflags --libs gstreamer-1.0 gstreamer-audio-1.0`
PKGS := gstreamer-1.0 gstreamer-audio-1.0 gstreamer-pbutils-1.0
CFLAGS += `pkg-config --cflags --libs $(PKGS)`

SRCS = $(wildcard *.c)
EXECS = $(patsubst %.c,%.x,$(SRCS))

all: $(EXECS)

%.x: %.c Makefile
	$(CC) $< -o $@ $(CFLAGS)

.PHONY: clean

clean:
	rm -f $(EXECS)
