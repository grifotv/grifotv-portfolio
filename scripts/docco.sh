#!/bin/bash
# Generated documentation for coffee-script files.
# Requires docco and pygments:
# > sudo npm install -g docco 
# > sudo easy_install Pygments

echo "Generating documentation..."
cd src/
docco *.coffee
