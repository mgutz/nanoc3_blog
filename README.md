# nanoc-blog

This is a customized [nanoc3](http://nanoc.stoneship.org/) blog. Features:

1. Uses SASS/HAML for markup.
2. Uses the filesystem_combined datasource so a separate .yaml metadata file is not needed for each item.
3. Uses Blueprint CSS framework.
3. Articles may be unpublished by setting `publish` to false at the top of the file:
    ---
    publish: false
    ---

## Installation

    % gem install rack mime-types nanoc3 haml
    
    
## Usage

### Adding Content

1. Create a new file under content. The path to the file must begin with a date in the following format--YYYY/MM/DD. The
front page uses this date information to select the newest posts. I suggest creating a YYYY subfolder to organize
your posts.

    % mkdir 2010
    % cd 2010
    % mate 01-18-my_first_post.haml

Add the following content:

    ---
    title: My First Post
    ---
    
    %h1 My First Post
    
Note the metadata is stored in the file, not a separate YAML file. Each file requires metadata section even if it 
is empty! Compile and browse the site:

    # preview cleans, compiles, then runs nanoc's autocompiler
    % rake preview
    
Point your browser to http://localhost:3000


## Deploying

Simply copy `content/*` to your public folder of your site. It's that easy.
    
## Naming Conventions

Hyphens in file names are converted to subdirectories in the output. You decide how you want to organize
your posts. 
    
    # e.g. These files render to the same output file.
    2010-01-01-post.haml #=> 2010/01/01/post.html
    2010/01-01-post.haml #=> 2010/01/01/post.html
    2010/01/01-post.haml #=> 2010/01/01/post.html
    
## FAQ

Q. Why are my pages not rolling to the front page?
A. The date must be encoded in the path of the file. The front page selects N newest files as featured articles based
on the date convention.

