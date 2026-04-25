#type: ignore
#Pylance doesn't need to check this Sphinx

# Configuration file for the Sphinx documentation builder.
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html


# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here.
import pathlib
import sys
import warnings
sys.path.insert(0, pathlib.Path(__file__).parents[2].resolve().as_posix())

# ----------------------------------------------------------------------------


# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'The Violence Tool'
copyright = '2024-2026, Fred, Daniil'
author = 'Daniil, Contributors'
release = '1.0'

# ----------------------------------------------------------------------------


# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

# Mock imports for modules that don't exist:
autodoc_mock_imports = ['pymodulefordocs',]
# ISSUE: The python script these docs are about isn't included, so this is to prevent a stopping error

templates_path = ['_templates']

root_doc = 'index'

exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store', '_troubleshooting/*.rst']

extensions = [
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

# Auto-generate docs from your module
autodoc_default_options = {
    'members': True,
    'undoc-members': True,
    'show-inheritance': True,
}

# -- Options for intersphinx -----------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/extensions/intersphinx.html#module-sphinx.ext.intersphinx

intersphinx_mapping = {
    # Python API (for developers)
    'blender_api': ('https://docs.blender.org/api/4.1/', None),

    # Blender Manual 4.1
    'blender_manual': ('https://docs.blender.org/manual/en/4.1/', None),
}
# Read the Docs recommends adding the following config value.
# Sphinx defaults to automatically resolve *unresolved* labels using all your Intersphinx mappings.
# This behavior has unintended side-effects, namely that documentations local references can
# suddenly resolve to an external location.
# See also:
# https://www.sphinx-doc.org/en/master/usage/extensions/intersphinx.html#confval-intersphinx_disabled_reftypes
intersphinx_disabled_reftypes = ["*"]

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

html_static_path = ['_static'] # This is correct if _static is in docs/source/

html_favicon = '_static/favicon.png'

html_theme_options = {
    "light_logo": "logo-light.png",
    "dark_logo": "logo-dark.png",

    "sidebar_hide_name": True,  # Shows project name at top of sidebar

    "footer_icons": [
        {
            "name": "GitHub",
            "url": "https://github.com/Danweel/ProjectViolenceDocs",
            "html": "",
            "class": "fa-brands fa-github",
        },
],

# LIGHT MODE
    "light_css_variables": {
    # Type
        "--font-stack": "font-family: -apple-system, BlinkMacSystemFont, avenir next, avenir, segoe ui, helvetica neue, Adwaita Sans, Cantarell, Ubuntu, roboto, noto, helvetica, arial, sans-serif",
        "--font-stack--monospace": "font-family: Menlo, Consolas, Monaco, Adwaita Mono, Liberation Mono, Lucida Console, monospace",
        "--font-stack--headings": "font-family: -apple-system, BlinkMacSystemFont, avenir next, avenir, segoe ui, helvetica neue, Adwaita Sans, Cantarell, Ubuntu, roboto, noto, helvetica, arial, sans-serif",

    # Sidebar
        "color-sidebar-brand-text": "#13118E",

    # Brand
        "color-brand-primary": "#ac3619",      # Main accent color (links, headers)
        "color-brand-content": "#2757dd",      # Links and content accents
        "color-brand-visited": "#833a10",

    # Background
        "color-background-primary": "#e2dfd7", # Page background
        "color-background-secondary": "#afc1c5", # Sidebar background

        "color-text-primary": "#0B2B68",       # Main text
        "color-text-secondary": "#0B2B68",     # Secondary text

        "color-foreground-primary": "#0E0E0E", # Headers
        "color-foreground-secondary": "#616161",

#        "color-code-background": "#13118e",    # Code block background
#        "color-code-foreground": "#1C8E85",    # Code text

    # Links
        "color-link": "#ac3619",
        "color-link--hover": "#1C8E85",
        "color-link-underline": "#13118E",
#        "color-link-underline--hover": "",

    # TOC Hightlight
        "color-toc-item--hover": "#914214",

    # Cards
        "color-card-background": "#afc1c5",
        "color-card-border": "#757575",
#        "color-card-header-background": #0B2B68,
#        "color-link": "#0B2B68",
#        "color-card-header-text":,

    # Admonitions
#        "admonition-font-size": "92%",
#        "admonition-title-font-size": "92%"
    },

# DARK MODE
    "dark_css_variables": {
    # Type
        "--font-stack": "font-family: -apple-system, BlinkMacSystemFont, avenir next, avenir, segoe ui, helvetica neue, Adwaita Sans, Cantarell, Ubuntu, roboto, noto, helvetica, arial, sans-serif",
        "--font-stack--monospace": "font-family: Menlo, Consolas, Monaco, Adwaita Mono, Liberation Mono, Lucida Console, monospace",
        "--font-stack--headings": "font-family: -apple-system, BlinkMacSystemFont, avenir next, avenir, segoe ui, helvetica neue, Adwaita Sans, Cantarell, Ubuntu, roboto, noto, helvetica, arial, sans-serif",

        "color-sidebar-brand-text": "#13118E",

    #    "color-brand-primary": "#1C8E85",      # Keep accent bright in dark mode
    #    "color-brand-content": "#21e8e4",
        "color-brand-visited": "#914214",

        "color-text-primary": "#e2dfd7",       # Light text
        "color-text-secondary": "#BDBDBD",

    # Background
        "color-background-primary": "#0E0E0E", # Dark page background
        "color-background-secondary": "#110E1B", # Dark sidebar
        "background-color": "#2da488", # Large download button mostly
    # Foreground
        "color-foreground-primary": "#e2dfd7",
        "color-foreground-secondary": "#9E9E9E",
        "color-brand-primary": "#2757dd",      # Keep accent bright in dark mode
        "color-foreground-muted": "#914214",
    # Sidebar
        "color-sidebar-brand-text": "#1C8E85",
    # Links
        "color-link--hover": "#21e8e4",
        "color-link-underline": "#113985",
        "color-link-underline--hover": "#2757dd",
    # TOC Highlighter
        "color-toc-item-text--hover": "#113985", # gets overridden @ '--color-toc-item-text--hover' by 'var(--color-foreground-primary)' by Furo
    # Code Blocks
#        "color-code-background": "#0B2B68",    # Dark code background
#        "color-code-foreground": "#E0E0E0",    # Light code text
    # Cards
        "color-card-background": "#110E1B",
        "color-card-border": "#0B2B68",
#        "color-card-header-background": #2757dd,
#        "color-link": "#0B2B68",
#        "color-card-header-text": #872ee0,

    # Admonitions
#        "admonition-font-size": "92%",
#        "admonition-title-font-size": "92%",
    },
}
html_css_files = [
    'custom.css', # Got some stuff in here, in case you don't find it above.
    # Basically, if the html has a var when you Inspect it, it can be set here via Furo,
    # if it doesn't, you have to custom.css it.
    # The author hid a lot of the sizes, leaving Furo mostly color-based in terms of customizations.
    # He's not wrong, people probably shouldn't be playing with the sizes too much.
]
# ---------------------------------------------------------------------------