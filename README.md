# mgutz.com blog

This is a customized [nanoc3](http://nanoc.stoneship.org/) blog. The main differences are:

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
    
    
## Articles

Items must be stored in a year subfolder, with the full date as the file name in this format:
 
    yyyy/mm/dd-title.haml
    
    # e.g.
    2010/2010-01-01-the_title_of_this_post.haml
    

