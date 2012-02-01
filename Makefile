#
# Change these according to your needs
#

CSS_SOURCES = \
	css/first.css \
	css/second.css \
	css/third.css \
	css/and_so_on.css

CSS_SOURCES_EXTRA = \
	css/specific-moz.css \
	css/specific-msie.css \
	css/specific-webkit.css

JS_SOURCES = \
	js/first.js \
	js/second.js \
	js/third.js \
	js/and_so_on.js

JS_SOURCES_EXTRA =

JS_MINIFIED_DEPS = \
	jquery-ui-1.8.6.custom/js/jquery-ui-1.8.6.custom.min.js \
	js/lib/jquery.tools.min.js

CSS_TARGET = css/all.min.css
JS_TARGET = js/all.min.js

#
# Do not change anything beneath
#

CSS_MINIFIED = $(addsuffix .min.css, $(basename ${CSS_SOURCES}))
JS_MINIFIED = $(addsuffix .min.js, $(basename ${JS_SOURCES}))
CSS_MINIFIED_EXTRA = $(addsuffix .min.css, $(basename ${CSS_SOURCES_EXTRA}))
JS_MINIFIED_EXTRA = $(addsuffix .min.js, $(basename ${JS_SOURCES_EXTRA}))

.PHONY: all clean minify_css concat_css minify_js concat_js

all: minify_css concat_css minify_js concat_js
	@echo Done.

minify_css: $(CSS_MINIFIED) $(CSS_MINIFIED_EXTRA)
minify_js: $(JS_MINIFIED) $(JS_MINIFIED_EXTRA)
concat_css: $(CSS_TARGET)
concat_js: $(JS_TARGET)

%.min.css: %.css
	@echo [css] $<
	@java -jar yuicompressor-2.4.2.jar $< -o $@

%.min.js: %.js
	@echo [js] $<
	@java -jar yuicompressor-2.4.2.jar $< -o $@

$(CSS_TARGET): $(CSS_MINIFIED)
#	@> $@ # truncate
#	@for file in $(CSS_MINIFIED); do cat $${file} >> $@; done
	@cat $(CSS_MINIFIED) > $@
	@echo "[tag] @import url(\"$@\");"

$(JS_TARGET): $(JS_MINIFIED)
#	@> $@ # truncate
#	@for file in $(JS_MINIFIED_DEPS); do cat $${file} >> $@; done
#	@for file in $(JS_MINIFIED); do cat $${file} >> $@; done
	@cat $(JS_MINIFIED_DEPS) > $@
	@cat $(JS_MINIFIED) >> $@
	@echo "[tag] <script type=\"text/javascript\" src=\"$@\"></script>"

clean:
	-@rm -f \
		$(CSS_MINIFIED) $(CSS_MINIFIED_EXTRA) $(CSS_TARGET) \
		$(JS_MINIFIED) $(JS_MINIFIED_EXTRA) $(JS_TARGET)
	@echo Cleaned.

delete_original:
	-@rm -f \
		${CSS_SOURCES} ${CSS_SOURCES_EXTRA} \
		${JS_SOURCES} ${JS_SOURCES_EXTRA}
