JSDIR="bin/js"
CSSDIR="bin/css"

#echo "Combining JS"

# Combine all the javascript to a single temporary file
#cat $JSDIR/lib/underscore.js \
#$JSDIR/lib/backbone.js \
#$JSDIR/lib/*jquery*.js \
#$JSDIR/lib/json2.js \
#$JSDIR/compiled.js > $JSDIR/tmp.js

#echo "Combining CSS"

# Combine all the css to a single temporary file
#cat $CSSDIR/reset.css > $CSSDIR/tmp.css

echo "Compressing APP JS..."
java -jar scripts/yuicompressor-2.4.6/build/yuicompressor-2.4.6.jar -o $JSDIR/app.min.js $JSDIR/app.js

echo "Compressing BG JS..."
java -jar scripts/yuicompressor-2.4.6/build/yuicompressor-2.4.6.jar -o $JSDIR/bg.min.js $JSDIR/bg.js

echo "Compressing CSS..."
java -jar scripts/yuicompressor-2.4.6/build/yuicompressor-2.4.6.jar -o $CSSDIR/style.min.css $CSSDIR/style.css

#echo "Cleaning up JS"
#rm $JSDIR/tmp.js

#echo "Cleaning up CSS"
#rm $CSSDIR/tmp.css
