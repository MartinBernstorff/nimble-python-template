# nimble-python-cookiecutter
A python package template intended for low maintenance and rapid package development.

## Getting started

Install copier
```
pipx install copier
```

Use template:
```bash
copier copy https://github.com/MartinBernstorff/nimble-python-cookiecutter /destination_dir
```
This will create a folder named `{package_name}` containing all the template files.


### Linking an existing repository
```bash
copier copy https://github.com/MartinBernstorff/nimble-python-cookiecutter .
```

Then run:
```bash
copier update
```