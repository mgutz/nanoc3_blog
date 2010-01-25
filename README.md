# nanoc3_blog

This is a customized [nanoc3](http://nanoc.stoneship.org/) blog site. Features:

1. Uses SASS/HAML for markup.
2. Uses the filesystem_combined datasource, so a separate .yaml metadata file is not needed for each item.
3. Rolls/archives articles to front page.
4. Generates tag pages.
5. Minimalist styling.

  
## Installation

    % gem install rack mime-types nanoc3 haml
    % git clone git://github.com/mgutz/nanoc3_blog.git your_blog
    
## Usage

### Adding Content

Create a new file under `content/`. The path to the file must begin with a date in the following format--YYYY/MM/DD. The
front page uses this date information to select the newest posts. I suggest creating a YYYY subfolder to organize
your posts:

    % mkdir 2010
    % cd 2010
    % mate 01-18-my_first_post.haml

Add the following content:

    ---
    title: My First Post
    kind: article
    created_at: 2010/01/18
    ---
    
    %h1 My First Post
    
Note: The metadata is stored in the same file, not a separate YAML file. Even stylesheets require an empty metadata
section. Compile and browse the site:

    % rake clean 
    % nanoc3 compile
    % nanoc3 aco
    
Browse http://localhost:3000 to see generated site.


## Deploying

Copy `ouput/*` to the public folder of your (hosted) web server.
    
## Naming Conventions

Hyphens in file names are converted to subdirectories in the output. You decide how you want to organize
your posts. 
    
    # e.g. These files render to the same output file.
    2010-01-01-post.haml #=> 2010/01/01/post.html
    2010/01-01-post.haml #=> 2010/01/01/post.html
    2010/01/01-post.haml #=> 2010/01/01/post.html
    
## FAQ

Q. Why are my pages not rolling to the front page?

A. You must set `title: Some title`, `kind: article` and `created_at: 2010/01/01` in the metadata section of the file.
Every file in `content/` must have a metadata section.

