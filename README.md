# `node-alpine-aws`

A docker image based on the official node alpine images with a couple
useful packages and tools installed that are common in Carimus pipelines,
primarily including the `aws` sdk and command line tools.

## Packages

### `apk`

 - `git`
 - `groff`
 - `less`
 - `python`
 - `py-pip`
 - `zip`
 - `build-base`
 - `bash`
 - `gettext` (e.g. `envsubst`, etc.)

### `pip`

 - `aws`

## Updates

The general workflow is as such:

 1. Update the [`Dockerfile.template`](./Dockerfile.template) as necessary.
 2. Run [`update.sh`](./update.sh) to update the node-version-specific `Dockerfile`s.
 3. Build and test locally (e.g. `build -t carimus/node-alpine-aws/test:node8 -f ./node8/Dockerfile .`)
 4. Add and commit the changes
 5. Run [`publish.sh`](./publish.sh) to build all images and push them up to docker hub. This will
    overwrite existing images there so be sure the images are backwards compatible.
