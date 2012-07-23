#!/bin/bash

echo "Compiling coffee script files..."
coffee --join bin/js/app.js --compile src/App.coffee src/AppState.coffee src/AppConfig.coffee src/AppService.coffee src/utils/ src/router/ src/model/ src/collection/ src/view/AppView.coffee src/view/AbstractView.coffee src/view/component/ src/view/header/ src/view/page/AbstractPageView.coffee src/view/page/about/ src/view/page/project/ src/view/page/projects/ src/view/page/stream/ src/view/page/tags/

#./scripts/compress.sh
#./scripts/docco.sh

echo "Done."