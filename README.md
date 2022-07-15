CapnCap
=======

Capture the HTML of a webpage using Firefox running in a virtual X server.

# Building
Everything runs in a docker container. Build the image like so:

    capncap build

# Running

    capncap run <url> <outfile>

The `<outfile>` will be stored in the `out` directory, which is mapped to the container
