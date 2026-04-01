# Configuration file for the Sphinx documentation builder.
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here.
import pathlib
import sys
sys.path.insert(0, pathlib.Path(__file__).parents[2].resolve().as_posix())

# ----------------------------------------------------------------------------


# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'TheViolenceDocs'
copyright = '2024-2026, Fred, Daniil'
author = 'Daniil, Contributors'
release = '0.1'

# ----------------------------------------------------------------------------


# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

# Mock imports for modules that don't exist:
autodoc_mock_imports = ['pymodulefordocs']
# ISSUE: The python script these docs are about isn't included, so this is to prevent a stopping error

templates_path = ['_templates']

root_doc = 'index'

exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store', '_troubleshooting/*.rst']

#

extensions = [
    'sphinx.ext.viewcode',         # Optional: Shows source code links if we ever host the .bpy
    'sphinx.ext.intersphinx',      # Allows sphinx to interact with other Read the Docs pages
    'sphinx.ext.todo',             # Allows for quick inline bugmaking on github
    'sphinxcontrib.mermaid',       # Required for Mermaid diagrams
    'sphinx.ext.autodoc',          # To autoread docstrings within py files
    'sphinx.ext.napoleon',         # To accomodate Google/NumPy docstrings
    'sphinx.ext.viewcode',         # Add "View Code"
    'notfound.extension',          # Required for custom 404 page
    'sphinx_copybutton',           # Allows for a copy button for codeblocks
    'sphinx_design',               # Cards, etc.
    'myst_parser'                  # Required for fullpage Markdown support in case contibutors are more comfortable writing .md files
]                                  # KNOWN ISSUE: myst_parser is in an odd format. This is normal but can throw warnings (that can be safely ignored)

# --------------------------------------------------------------------------


# -- Options for viewcode --------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/extensions/viewcode.html

viewcode_line_numbers = True
# viewcode_find_source(app, modname)  # not sure we can use this. check.

# --------------------------------------------------------------------------

# Auto-generate docs from your module
autodoc_default_options = {
    'members': True,
    'undoc-members': True,
    'show-inheritance': True,
}

# -- Options for intersphinx -----------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/extensions/intersphinx.html#module-sphinx.ext.intersphinx

intersphinx_mapping = {
    'blender': ('https://docs.blender.org/api/current', None),
    # ... other mappings
}

# ---------------------------------------------------------------------------


# -- Options for todo extension ---------------------------------------------

todo_include_todos = True

# ---------------------------------------------------------------------------


# -- 404 Not Found customization --------------------------------------------
# https://sphinx-notfound-page.readthedocs.io/en/latest/

notfound_template = '404.html' # Optional: Explicitly set the 404 template if needed (usually automatic)

notfound_context = {
    'title': 'Page Not Found',
    'body': 'The page you are looking for does not exist.',
}
# Optional: add URLs that should always work
notfound_urls_prefix = '/en/latest/'  # For versioned docs

# ---------------------------------------------------------------------------


# -- 'Sphinx Contrib for Mermaid' Template ----------------------------------
# https://sphinxcontrib-mermaid-demo.readthedocs.io/en/latest/index.html
# Mermaid allows for text-based charts that are more versionable than images

mermaid_version = '11.13.0'  # Pinning Mermaid JS version to ensure build stability.
# Update this version only after testing with the new Mermaid release.

mermaid_init_js = "mermaid.initialize({startOnLoad:true});"
# mermaid_params = ['--theme', 'forest', '--width', '600', '--backgroundColor', 'transparent']

# --------------------------------------------------------------------------


# -- MyST Configuration ----------------------------------------------------
# https://myst-parser.readthedocs.io/en/latest/syntax/optional.html

myst_enable_extensions = [
    'colon_fence',      # Use ::: for directives
    'deflist',          # Definition lists
#   'dollarmath',       # LaTeX math syntax
    'html_admonition',  # HTML admonitions
    'linkify',          # Auto-link URLs
]

# Optional: Configure how MyST handles certain syntax
myst_heading_anchors = 4  # Add anchors to headings up to level 3

# --------------------------------------------------------------------------


# -- Options for HTML output ---------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'furo'

# html_logo = "logo.png"

# html_theme_options = {
#    "light_css_variables": {
#        "color-brand-primary": "red",
#        "color-brand-content": "#CC3333",
#        "color-admonition-background": "orange",
#    },
#    "dark_css_variables": {
#        "color-brand-primary": "red",
#        "color-brand-content": "#CC3333",
#        "color-admonition-background": "orange",
#    },
# }

# ---------------------------------------------------------------------------