.PHONY: help install format

help:
	@cat $(MAKEFILE_LIST)

install:
	pwsh install.ps1

format:
	python3 -m black --target-version py27 PublicMaps
