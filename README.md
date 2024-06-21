# nimble-python-template
A python package template intended for low maintenance and rapid package development.

## Getting started

Install copier
```
pipx install copier
```

### New project
```bash
copier copy https://github.com/MartinBernstorff/nimble-python-template .
```

### Updating
```bash
copier update --skip-answered .
```

### Linking an existing repository
```bash
copier copy https://github.com/MartinBernstorff/nimble-python-template .
```

### Restoring after drift
```bash
copier recopy https://github.com/MartinBernstorff/nimble-python-template .
```
