# Build VSCode for Anyscale

To pick a new release of VSCode:

* Update the frok from upstream.
* `git checkout <release-tag>`
* `git checkout -b anyscale-<release-tag>`
* Cherry-pick the latest commit from this branch into the new release branch and publish so buildkite can build it.

If you hit any build errors due to missing system dependencies make sure to inspect the Azure buid definition files for hints on missing dependencies.

If you hit any typescript errors consult the contribution README for how to build locally and resolve them.