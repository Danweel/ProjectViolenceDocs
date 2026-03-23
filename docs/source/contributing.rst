.. _contributing:

Contributing
============

## Setting up to work on adding content
These instructions are just for people who want to add large amounts of content to the docs.
If you want to add small amounts or suggestions, there's a few simpler ways to do that PLACE A LINK TO INSTRUCTIONS here

The docs are actually written in [reStructuredText](https://restructuredtext-guide.readthedocs.io/en/latest/ch_first_steps.html), a type of [markdown](https://en.wikipedia.org/wiki/Markdown). See the reStructuredText hyperlink for some instruction for this.
[Sphinx is basically a set of documentation tools](https://www.sphinx-doc.org/en/master/faq.html#sphinx-vs-docutils) that aids in publishing to different formats with its [buillders](https://www.sphinx-doc.org/en/master/usage/builders/index.html) as well as other tools. If you're famliar with DocUtils, it's like that but offers a few more things.
[Read the Docs is a website platform] that helps documentation writers version and build thier docs faster, with [Github](https://www.geeksforgeeks.org/git/what-is-github-and-how-to-use-it/) integration. It's free for small projects like ours.
Once you've created markdown in the rst files, these systems work together to keep all that information organized internally and posted to the web.


1. PLACEHOLDER instructions for running the .sh file
    - What the script file will do with regards to the above systems.
    - What is taken care of automatically
    - What remains that you have to do
2. PLACEHOLDER instructions for explaining where the .rst files are
    - How to edit them 
    - How to save
    - How to push the changes to Github - the commit.
    - What happens then?
    - Updating - pull to sync your changes.
3. How to check if things are live. PLACEHOLDER

.. note:: If you are working in a Linux environment, I'd strongly advise to install your editor as a .deb file rather than as a flatpak. Flatpak installations are already an environment so they tend to confuse things, espeically with regards to using the text editor's built-in terminal - it's very confusing for beginners.

## Setting up for Development

You only need to set up for development if you're looking to help maintain the repo. Chances are you have some experience with coding, yaml and conf files, maybe even have deployed documentation before.
There's always a good chance that this project isn't set up exactly like what you've done before, so consider the next details carefully:

1. PLACEHOLDER instructions for running the .sh file
    - What the script file will do with regards to the above systems.
    - What is taken care of automatically
    - What remains that you have to do
2. PLACEHOLDER instructions for explaining major aspects of the project structure
3. ANYTHING ELSE?

    .. note:: Understanding Your Virtual Environment Folder Name

   You might notice a folder named something like ``projectviolencedocs-CjdI7n0o-py3.12`` in your project directory. 
   Don't worry—this is **normal** and intentional!

   **Why such a strange name?**
   
   Poetry generates a unique hash (the ``-CjdI7n0o-`` part in the example case) based on your project's path and configuration. This ensures:
   
   * **Strict Isolation:** Even if you have two different projects with the same name (e.g., ``myapp`` in different folders), they won't accidentally share the same virtual environment.
   * **Version Tracking:** The ``-py3.12`` suffix clearly indicates which Python version the environment uses.
   
   Renaming the folder manually can break Poetry's internal tracking, causing it to think the environment is missing and recreate a new one. Keeping it inside the project folder (as we have done here) makes it easier to see exactly which environment belongs to which project at a glance.


.. _maintenance:
