## Asciidoc Tweakable Themes

Welcome! This is most of my personal tweaks to the default theme extracted. It has a few tweaks to make sure that the compiled css file can be used with both a2x and asciidoc with consistency.

## Dependencies
- `sassc` for compiling
- `pygmentize` for custom pygment theme embedded (optional)

## Compiling

Theme recolors are listed in `src/colors/*.scss`. To make a theme, run
`make theme-name`. You'll find the new theme in `output/theme-name`.

If you need physical indents (because libreoffice), append -physical to the
theme name.

## How to use output
* `a2x -f xhtml -r "$(realpath output/theme-name)" --stylesheet="theme-name.css"`
* `asciidoc -a themedir="$(realpath output/theme-name)" -a theme=theme-name`
