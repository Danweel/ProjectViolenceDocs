cat > docs/source/alt-setups.rst << 'EOF'
.. _alt-setups:

Community Workflows
===================

The Violence Layer Manager was designed with a specific workflow in mind, but each person's artstyle might modify the way it works. Below is a collection of how others have modified,
extended, or adapted the tool for their own projects.

.. note::
    This section is for users who want to customize their setup beyond the default configuration.
    Have a setup to share? Submit it via our `GitHub Issue Form <https://github.com/Danweel/ProjectViolenceDocs/issues/new?template=alt-setup-submission.yml>`


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

EOF
