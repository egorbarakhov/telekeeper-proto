**Telekeeper Proto**
=========================

This repository provides a collection of `.proto` files for generating gRPC stubs in Python and Ruby. The stubs are generated using the `protoc` compiler and published as libraries to GitHub Packages.

**Repository Structure**
------------------------

* `proto/`: contains the `.proto` files that define the gRPC services and messages.
* `ruby/`: contains the generated Ruby library and gemspec file.
* `python/`: contains the generated Python library and wheel file.
* `scripts/`: contains scripts for generating the stubs and publishing the libraries.
* `.github/workflows/`: contains the GitHub Actions workflow file for automating the publishing process.

**Usage**
-----

To use this repository, follow these steps:

1. Clone the repository: `git clone https://github.com/EgorBarakhov/telekeeper-proto.git`
2. Generate the stubs: `./scripts/generate.sh`
3. Install the Ruby gem: `gem install telekeeper-grpc`
4. Install the Python wheel: `pip install telekeeper-grpc`

**Publishing**
-------------

The libraries are published to GitHub Packages using the `.github/workflows/publish.yml` workflow file. The workflow is triggered on push events to the `master` branch.

**Versioning**
-------------

The version of the libraries is set to the current date and time in the format `YYYYMMDDHHMMSS`. This version is exported to the environment variable `VERSION` and used in the gemspec and wheel files.

**Contributing**
--------------

If you'd like to add new `.proto` files or modify existing ones, please submit a pull request.
