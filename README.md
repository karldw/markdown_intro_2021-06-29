
# Intro to Markdown

June 29, 2021

## [PDF slides here](markdown_talk.pdf)




## Sources

- Markdown syntax ([basic](https://www.markdownguide.org/basic-syntax) and [extended](https://www.markdownguide.org/extended-syntax))
- [R Markdown](https://rmarkdown.rstudio.com/)
- [Palmer Penguins](https://github.com/allisonhorst/palmerpenguins0)
- [HedgeDoc](https://hedgedoc.org/)





## Generate slideshow



#### Render to html


The basic version is just `Rscript -e "rmarkdown::render('markdown_talk.md')"`

But you can watch for changes with `inotifywait`:
```sh
while inotifywait -e modify markdown_talk.md; do
    Rscript -e "rmarkdown::render('markdown_talk.md')"
done
```




#### Print to PDF

For some reason, reveal.js is a pain to print from html. Here I use [decktape](https://github.com/astefanutti/decktape/) to render to PDF. (Using podman, an easier alternative to docker.)



Build the docker image if necessary (the official decktape docker image gave me permission errors):

```sh
mkdir tmp
podman build -t decktape -f decktape_container.dockerfile tmp
rmdir tmp
```

Run decktape.
It has no idea when each HTML page is done loading or rendering, so you have to set pauses.
(The default `--pause` of 1000ms is longer than necessary, but the default `--load-pause` of 0ms isn't long enough. Here I make both 500ms.)
```
podman run --rm -it -v .:/slides decktape --size 1920x1080 --pause 500 --load-pause 500 reveal markdown_talk.html markdown_talk.pdf
```
