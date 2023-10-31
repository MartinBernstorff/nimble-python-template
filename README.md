# nimble-python-cookiecutter
A python package template intended for low maintenance and quick package development.

## Getting started

Install cruft
```
pip install cruft
```

Use template:
```bash
cruft create https://github.com/MartinBernstorff/nimble-python-cookiecutter
```
This will create a folder named `{package_name}` containing all the template files.

### Linking an existing repository
```bash
cruft link https://github.com/MartinBernstorff/nimble-python-cookiecutter
```

You'll be asked to select a commit to link to. This will be the 'reference commit', and all commits after this will be applied to your repository when you run `cruft update`.

If you would like to apply everything from the template to your current repository, specify the first commit `e73f94ed000f399044a22f94e0b30a53b3fed6d5`.

Then run:
```bash
cruft update
```

## Recommended setup for the repository
To see the recommended setup for the repository, see the following file:
`{package_name}/.github/recommended_repo_setup.md`

## Examples
Examples of projects using this template

- Martin's [Personal Mnemonic Medium](https://github.com/MartinBernstorff/personal-mnemonic-medium/)
