.. _altsetups:

Alternative Setups
==================

The Violence Layer Manager was designed with a specific workflow in mind, but each person's artstyle might modify the way it works. Below is a collection of how others have modified,
extended, or adapted the tool for their own projects.

.. note::
    Have you used the tool for your own projects? We'd like to showcase examples of how the tool can be organized for other projects so people have a better understanding of how the tool works.

    Please open an `Issue <https://github.com/Danweel/ProjectViolenceDocs/issues>`_ or submit a `Pull Request <https://github.com/Danweel/ProjectViolenceDocs/pulls>`_
    to add your adaptation to this list.

    Or, open an **Issue** with your story, and we can format it for you!

    Or you can just contact @Danweel on Discord.


.. _adaptation-1:

- Project name
- Credit
- Animationlinks

How the project required something different than the original workflow:

How the workflow was modified to address this:
    - Files modified
    - Workflow steps modified
    - Tips

Steps, if needed:

Any interesting new, differing code:

.. code-block:: python

        # Example snippet from User X
        cam_z = context.scene.camera.location.z
        obj_z = context.active_object.location.z
        if abs(cam_z - obj_z) < 5.0:
            # Switch to close-up layer
            bpy.ops.object.gpencil_active_layer_set(layer_name="Close_Up_Lines")


