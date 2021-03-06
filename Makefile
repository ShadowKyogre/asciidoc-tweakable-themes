all:

define make-css-theme
	-rm src/_colors.scss
	ln -s colors/$*.scss src/_colors.scss
	mkdir -p output/$@/
	sassc src/theme.scss output/$@/$@.css
	sassc src/slidy.scss output/$@/slidy.css
	sassc src/toc2.scss  output/$@/toc2.css
endef

define make-css-theme-physical
	-rm src/_colors.scss
	ln -s colors/$*.scss src/_colors.scss
	mkdir -p output/$@/
	sassc src/theme-physical.scss output/$@/$@.css
endef

define make-pygment-scheme
	echo ".highlight { background: transparent !important; }" >> output/$@/$@.css
	-pygmentize -S "$$(sed -n 1p src/colors/$*.pygment)" -f html | \
		sed -e 's|color: \(#[a-fA-F0-9]\{6\}\)|color: \1 !important|g;s|^|.highlight |g' >> output/$@/$@.css
endef

%: src/colors/%.scss
	$(make-css-theme)
	$(make-pygment-scheme)

%-physical: src/colors/%.scss
	$(make-css-theme-physical)
	$(make-pygment-scheme)

clean:
	-rm -r output/
	-rm src/_colors.scss
