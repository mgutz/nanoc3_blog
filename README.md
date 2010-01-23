# mgutz.com blog

This is a customized [nanoc3](http://nanoc.stoneship.org/) blog. Features:

1. Uses SASS/HAML for markup.
2. Uses the filesystem_combined datasource so a separate .yaml metadata file is not needed for each item. Metadata
must be within each item

    ---
    title: Some item
    ---
    
For items that do not need metadata, it's simply 

    ---
    ---

## Installation

    % gem install rack mime-types nanoc3 haml
    
    
## Items

Hyphens in item identifiers are converted to subdirectories in the output. You decide how you want to organize
your posts. 
    
    # e.g. These files render to the same output file.
    2010-01-01-post.haml #=> 2010/01/01/post.html
    2010/01-01-post.haml #=> 2010/01/01/post.html
    2010/01/01-post.haml #=> 2010/01/01/post.html