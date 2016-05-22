all:

define make-css-theme
	-rm src/_colors.scss
	ln -s colors/$*.scss src/_colors.scss
	mkdir -p output/$*/
	sassc src/theme.scss output/$*/$*.css
endef

define make-pygment-scheme
	-pygmentize -S "$$(sed -n 1p src/colors/$*.pygment)" -f html | \
		sed -e 's|color: \(#[a-fA-F0-9]\{6\}\)|color: \1 !important|g;s|^|.highlight |g' >> output/$*/$*.css
endef

%: src/colors/%.scss
	$(make-css-theme)
	$(make-pygment-scheme)

%-physical: src/colors/%.scss
	$(make-css-theme)
	$(make-pygment-scheme)

clean:
	-rm -r output/
	-rm src/_colors.scss
