# PortKill Makefile
# Copyright (c) 2025 Abraham Esandayinze Tanta

SHELL := /bin/bash
PREFIX ?= /usr/local
BINDIR := $(PREFIX)/bin
SCRIPT := bin/portkill
TARGET := portkill
VERSION := 2.0.0

.PHONY: all install uninstall test clean help

all: help

install:
	@echo "Installing PortKill to $(BINDIR)"
	@mkdir -p $(BINDIR)
	@cp $(SCRIPT) $(BINDIR)/$(TARGET)
	@chmod +x $(BINDIR)/$(TARGET)
	@echo "PortKill v$(VERSION) installed successfully"

uninstall:
	@echo "Uninstalling PortKill from $(BINDIR)"
	@rm -f $(BINDIR)/$(TARGET)
	@echo "PortKill uninstalled"

test:
	@echo "Running tests..."
	@bash test/run_tests.sh

clean:
	@echo "Cleaning temporary files..."
	@rm -rf ~/.portkill/*.tmp
	@rm -rf test/*.tmp

help:
	@echo "PortKill v$(VERSION) - Build System"
	@echo ""
	@echo "Usage:"
	@echo "  make install    Install portkill to $(PREFIX)/bin"
	@echo "  make uninstall  Remove portkill from system"
	@echo "  make test       Run test suite"
	@echo "  make clean      Clean temporary files"
	@echo "  make help       Show this help message"
	@echo ""
	@echo "Variables:"
	@echo "  PREFIX=$(PREFIX) (installation prefix)"