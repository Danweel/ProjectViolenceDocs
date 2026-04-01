.. TheViolenceDocs documentation master file, created by
   sphinx-quickstart on Fri Jun 28 22:32:48 2024.

Welcome to The Violence Tool Documentation
==========================================

.. image:: https://via.placeholder.com/150  <-- Add a logo or hero here PLACEHOLDER
   :align: center

**The Violence Layer Management Tool** is a Python script for Blender 4.1 and 4.1.1 that manages animation layers and adds additional functionality for Blender Grease Pencil. It is currently being used for the [A Fox in Space](https://www.imdb.com/title/tt6499450/) animation project.

Quick Start
-----------

* **Need to install?** See the :doc:`setup` guide.
* **New here?** Start with the :doc:`onboarding` guide to download practice files.
* **Ready to draw?** Jump to the :doc:`usage` guide.

.. grid:: 1 2 3 3
   :gutter: 2

   .. grid-item-card:: Setup & Install
      :link: setup
      :link-type: doc

      Install the tool, verify setup, and configure basics.

   .. grid-item-card:: Get Started
      :link: onboarding
      :link-type: doc

      Download practice files and follow the step-by-step guide.

   .. grid-item-card:: 📖 Usage Guide
      :link: usage
      :link-type: doc

      Learn workflows, practice files, and advanced techniques.

   .. grid-item-card:: 🛠️ Custom Use-cases
      :link: altsetups
      :link-type: doc

      Alternative setups, custom keybindings, and community workflows.

   .. grid-item-card:: 🤝 Contributing
      :link: contrib-maintain
      :link-type: doc

      How to contribute to the tool and documentation.

.. warning::

   **The Violence Layer Manager requires a specific Grease Pencil setup.**

   Your GP Object must use the multi-layer format with the ``1234/QWER/ASDF`` material slot configuration. If your object doesn't match this format, the add-on will not function correctly.

   See :doc:`installation` for full requirements.

.. toctree::
   :hidden:
   :maxdepth: 2
   :caption: User Guide

   onboarding
   setup
   keybindings
   usage
   altsetups

.. toctree::
   :hidden:
   :maxdepth: 2
   :caption: Community

   other-guides
   troubleshooting

.. toctree::
   :hidden:
   :maxdepth: 2
   :caption: For Developers

   api-reference
   contrib-maintain