fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios lint_code

```sh
[bundle exec] fastlane ios lint_code
```

Lint code

### ios format_code

```sh
[bundle exec] fastlane ios format_code
```

Lint and format code

### ios sort_files

```sh
[bundle exec] fastlane ios sort_files
```

Sort Xcode project files

### ios prepare_pr

```sh
[bundle exec] fastlane ios prepare_pr
```

Prepare for a pull request

### ios build_dev_app

```sh
[bundle exec] fastlane ios build_dev_app
```

Build development app

### ios tests

```sh
[bundle exec] fastlane ios tests
```

Run unit tests

### ios download_profiles

```sh
[bundle exec] fastlane ios download_profiles
```

Download certificates and profiles

### ios create_new_profiles

```sh
[bundle exec] fastlane ios create_new_profiles
```

Create all new provisioning profiles managed by fastlane match

### ios nuke_profiles

```sh
[bundle exec] fastlane ios nuke_profiles
```

Nuke all provisioning profiles managed by fastlane match

### ios add_device

```sh
[bundle exec] fastlane ios add_device
```

Add a new device to provisioning profile

### ios archive_internal

```sh
[bundle exec] fastlane ios archive_internal
```

Creates an archive of the Internal app for testing

### ios archive_appstore

```sh
[bundle exec] fastlane ios archive_appstore
```

Creates an archive of the Production app with Appstore distribution

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
