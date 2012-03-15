#!/bin/bash

echo "Compiling coffee script files..."
/usr/local/bin/coffee --join bin/js/app.js --compile src/App.coffee src/AppConfig.coffee src/AppStatus.coffee src/Console.coffee src/utils/ src/router/ src/model/ src/collection/ src/view/

echo "Done."