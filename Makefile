# Why two targets: `hugo server` writes an unhashed /css/styles.css, a
# production build writes /css/styles.<hash>.css and --gc deletes the other
# one. Run a plain `hugo` while a server is running and the pages each build
# did not rewrite keep linking a stylesheet that no longer exists – they load
# without any styling. `serve` therefore keeps its output in memory and never
# touches public/, which belongs to the production build alone.

.PHONY: serve build clean

serve:
	hugo server --renderToMemory

build: clean
	hugo --gc --minify

clean:
	rm -rf public resources .hugo_build.lock
