all:

%: src/colors/%.scss
	-rm src/_colors.scss
	ln -s colors/$*.scss src/_colors.scss
	mkdir -p output/$*/
	sassc src/theme.scss output/$*/$*.css

%-physical: src/colors/%.scss
	-rm src/_colors.scss
	ln -s colors/$*.scss src/_colors.scss
	mkdir -p output/$*/
	sassc src/theme-physical.scss output/$*/$*.css

clean:
	-rm -r output/
	-rm src/_colors.scss
