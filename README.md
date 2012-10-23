# A Makefile for JavaScript and CSS minification & concatenation

***

**CSS_SOURCES** - Defines which CSS files will be minified and included in the resulting `.min.css` file. Example:

	CSS_SOURCES = \
		css/first.css \
		css/second.css \
		css/third.css \
		css/and_so_on.css

**CSS_SOURCES_EXTRA** - Defines which CSS files will be minified and result in their own exclusive `.min.css` file.
This is used when you have multiple CSS files that are specific to each browser and/or rendering engine.
The resulting files receive a `.min.css` extension, despite their original extension. Example:

	CSS_SOURCES_EXTRA = \
		css/specific-moz.css \
		css/specific-msie.css \
		css/specific-webkit.css

**JS_SOURCES** - Defines which JS files will be minified and included in the resulting `.min.js` file. Example:

	JS_SOURCES = \
		js/first.js \
		js/second.js \
		js/third.js \
		js/and_so_on.js

**JS_SOURCES_EXTRA** - Defines which JS files will be minified and result in their own exclusive `.min.js` file.
This is used when you have multiple JS files that are specific to each browser and/or JavaScript engine.
The resulting files receive a `.min.js` extension, despite their original extension. Example:

	JS_SOURCES_EXTRA = js/specific-v8.js

**JS_MINIFIED_DEPS** - Defines which JS dependencies are already minified and must preceed all other files
defined in `JS_SOURCES` in the resulting `.min.js` file. Example:

	JS_MINIFIED_DEPS = \
		jquery-ui-1.8.6.custom/js/jquery-ui-1.8.6.custom.min.js \
		js/lib/jquery.tools.min.js

**CSS_TARGET** - Defines the resulting (minified and concatenated) CSS file. Example:

	CSS_TARGET = css/all.min.css
	
**JS_TARGET** - Defines the resulting (minified and concatenated) JS file. Example:

	JS_TARGET = js/all.min.js

***
### Dependencies
+ [YUI Compressor](http://yuilibrary.com/download/yuicompressor/)
