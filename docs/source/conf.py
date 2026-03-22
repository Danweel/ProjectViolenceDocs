# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html


# -- Path setup --------------------------------------------------------------
# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here.
import pathlib
import sys
sys.path.insert(0, pathlib.Path(__file__).parents[2].resolve().as_posix())

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'TheViolenceDocs'
copyright = '2024-2026, Fred, Daniil'
author = 'Daniil, Contributors'
release = '0.1'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

# -- Autodoc configuration ---------------------------------------------------
extensions = [
    'sphinx.ext.autodoc',
    'sphinx.ext.viewcode',
    'sphinx.ext.napoleon',
    'sphinx.ext.todo',
    'sphinx.ext.doctest'
    'notfound.extension'
    'sphinxcontrib.mermaid'
]

templates_path = ['_templates']
# -- 'Not Found Extension' Template -----------------------------------------
# Optional: customize the 404 page
notfound_template = '404.html'  # Custom template
notfound_context = {
    'title': 'Page Not Found',
    'body': 'The page you are looking for does not exist.',
}
# Optional: add URLs that should always work
notfound_urls_prefix = '/en/latest/'  # For versioned docs

# --------------------------------------------------------------------------
# -- 'Sphinx Contrib for Mermaid' Template ---------------------------------
# Mermaid allows for text-based charts that are more versionable than images

mermaid_version = "9.4.0"  # Specific Mermaid.js version
mermaid_init_js = "mermaid.initialize({startOnLoad:true});"

# Example usage
## .. mermaid::

#   graph LR
#      A[Start] --> B{Decision}
#      B -->|Yes| C[Process]
#      B -->|No| D[End]
#      C --> D

# .. mermaid::

#   sequenceDiagram
#      Client->>Server: Request
#      Server->>Database: Query
#      Database-->>Server: Result
#      Server-->>Client: Response

# --------------------------------------------------------------------------
# -- General configuration (cont)---------------------------------------------------

exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store']

# Mock imports for modules that don't exist yet:
autodoc_mock_imports = ['pymodulefordocs'] # The python script these docs are about

# -- TODO #1 Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'groundwork'
#html_static_path = ['build\html\source\_static']
#html_theme_options = {
#    "light_css_variables": {
#        "color-brand-primary": "red",
#        "color-brand-content": "#CC3333",
#        "color-admonition-background": "orange",
#    },
#}