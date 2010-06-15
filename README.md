# nanoc3_blog

This is a [nanoc3](http://nanoc.stoneship.org/) blog starter kit. FreeBSD licensed.

View this project on [nanoc3-blog.mgutz.com](http://nanoc3-blog.mgutz.com/).

Features

1. Uses the appropriate filter based on the file extension: .erb -> ERB, .haml -> HAML, .md, .markdown -> BlueCloth, .sass -> SASS
2. Uses the filesystem\_unified datasource, so metadata file or header is optional.
3. Rolls/archives articles to front page.
4. Generates tag pages.
5. Minimalist styling.
6. Uses SASS
7. DISQUS integration.

## Prerequisites

Know how to use `terminal, Ruby, HAML, SASS` and `Markdown`.

## Installation

From the command line

    % gem install bundler
    % git clone git://github.com/mgutz/nanoc3_blog.git your_blog
    % cd your_blog
    % bundle install

## Previewing the Site

Compile the site

    # cleans output/ directory. `rm -rf output` works just as well
    % rake clean 

    # compiles content/* and copies static/* to output/
    % nanoc compile

    # runs preview server and autocompile on page refresh
    % nanoc aco

Preview the site on `http://localhost:3000`


## Customizing Existing Content

Edit these two files:

    content/about.md
    content/sticky.md # box content on front page

Delete articles to remove them from site. Then, recompile and restart server.

To change the front page: `content/index.haml`

To change the site layout: `layouts/default.haml`

To style the site: `content/assets/style.sass`


## Adding Content

Edit the Markdown file created by running this command:

    # filename is written to console
    % rake create:article title='Hello world'

View your page after compiling or refresh in preview mode.


### Adding Static Files

Put static files into the `static/` folder instead of `content/`. `static/*` is copied to the `output/` folder on compile and preview.


## Configuration

Edit these files:

    config.yaml
    atom.xml.erb

### Commenting

DISQUS comment service allows users to post comments on your static site. As such, one must register your site on [DISQUS](http://disqus.com) to
use their service. Once registered, simply uncomment and adjust `disqus_shortname` in `config.yaml`. Uncommenting this setting
enables comments in articles.


## Deploying

Copy `output/*` to the public folder of your web server.

Or, if you use rsync:

    # configuration is in config.yml
    rake deploy:rsync

## Naming Conventions

Hyphens in file names are converted to subdirectories in the output. You decide how you want to organize
your posts. 

    # e.g. These files render to the same output file.
    2010-01-01-post.haml #=> 2010/01/01/post.html
    2010/01-01-post.haml #=> 2010/01/01/post.html
    2010/01/01-post.haml #=> 2010/01/01/post.html

Files may use Rails naming conventions, in which the first extension is retained for the output file
and the second determines the template processor:

    sitemap.xml.erb #=> generate sitemap.xml using erb processor

If a single extension is used, then the files are assumed to be CSS and HTML:

    .sass #=> .css
    .* #=> .html
