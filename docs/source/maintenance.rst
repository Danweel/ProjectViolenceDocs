.. _maintenance:

Maintenance Guide
=================

Maintenance & Updates for repo maintainers
------------------------------------------

This section covers how to update various components of the documentation project safely.

Updating Sphinx
~~~~~~~~~~~~~~~

Sphinx and its extensions are managed via Poetry in pyproject.toml.

**When to update:**

    - Security vulnerabilities are reported
    - New features are needed
    - Compatibility issues arise

**How to update:**

    1. Check for outdated packages:
    ```
    poetry show --outdated
    ```

    2. Update a specific package:
    ```
    poetry update sphinx
    poetry update sphinx-rtd-theme
    ```

    3. Update all packages:
    ```
    poetry update
    ```

    4. Test the build:
    ```
    rm -rf docs/_build
    poetry run sphinx-build -b html docs/source docs/_build/html
    ```

    5. Review changes:
    ```
    git diff pyproject.toml poetry.lock
    ```

    6. Commit if successful:
    ```
    git add pyproject.toml poetry.lock
    git commit -m "Update Sphinx dependencies"
    ```

    **Best Practice:** Update packages individually rather than all at once. This makes it easier to identify which package caused an issue if something breaks.

Extensions
----------

Updating Mermaid Diagrams
~~~~~~~~~~~~~~~~~~~~~~~~~

The Mermaid JavaScript library is pinned to a specific version in docs/source/conf.py to ensure build stability.

**When to update:**
   - A new Mermaid feature is released that you want to use
   - Security vulnerabilities are reported in the current version
   - The CDN becomes unreliable for the pinned version

**How to update:**
   1. Check the latest stable version at https://github.com/mermaid-js/mermaid/releases
   2. Update the version in docs/source/conf.py:
      ```python
      mermaid_version = 'X.Y.Z'  # Replace with new version
      ```
   3. Test locally:
      ```
      rm -rf docs/_build
      poetry run sphinx-build -b html docs/source docs/_build/html
      xdg-open docs/_build/html/index.html
      ```

   4. Verify all Mermaid diagrams render correctly
   5. Commit the change:
      ```
      git add docs/source/conf.py
      git commit -m "Update Mermaid to vX.Y.Z"
      ```

    **Important:** Always test before committing. New Mermaid versions may have breaking changes that affect diagram syntax.

Updating or changing the theme
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**When to update:**
Avoid being fickle about changing the theme often, but sometimes things become unsupported and a change is wise.

**How to update:**
PLACEHOLDER for instructions here.