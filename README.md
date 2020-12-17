# Screxe

**Screxe**: An abbreviation for "script execute".
A remote repository containing a collection of useful scripts.
These scripts are fetched from this remote when executed to ensure:
1. Scripts are always up to date when executed
2. Quick and easy to share scripts across clients/devices 

For ease of use, the `screxe.sh` script can be installed (locally) in the user's `PATH` to be used as shorthand to fetch other scripts.

## Example
With helper script:
```bash
screxe.sh <scriptName.sh>
```

Otherwise:
```bash
bash -l -c "$(curl -sfL https://raw.githubusercontent.com/BenShutt/Screxe/master/Scripts/<scriptName.sh>)"
```

## Scripts

### [pruneLocalBranches.sh](https://github.com/BenShutt/Screxe/blob/master/Scripts/pruneLocalBranches.sh)
Remove local branches which are `gone` on the remote. E.g. merged or deleted and no further along than another remote branch.

### [removeCarthageCache.sh](https://github.com/BenShutt/Screxe/blob/master/Scripts/removeCarthageCache.sh)
Remove [Carthage](https://github.com/Carthage/Carthage) cache.

### [carthageFrameworkFind.sh](https://github.com/BenShutt/Screxe/blob/master/Scripts/carthageFrameworkFind.sh)
List all iOS `.framework` files installed using  [Carthage](https://github.com/Carthage/Carthage).
Execute from the root of a project.

### [removeXcodeDerivedData.sh](https://github.com/BenShutt/Screxe/blob/master/Scripts/removeXcodeDerivedData.sh)
Remove Xcode's derived data.

### [removeXcode.sh](https://github.com/BenShutt/Screxe/blob/master/Scripts/removeXcode.sh)
Remove Xcode from the macOSX file system.

## Install
To install the helper script simply run:
```bash
bash -l -c "$(curl -sfL https://raw.githubusercontent.com/BenShutt/Screxe/master/install.sh)"
```
This will run the `install.sh` script on this remote repository which saves `screxe.sh` to
your `PATH` (`/usr/local/bin`)

## Uninstall
To uninstall the helper script simply run:
```bash
bash -l -c "$(curl -sfL https://raw.githubusercontent.com/BenShutt/Screxe/master/uninstall.sh)"
```
This will run the `uninstall.sh` script on this remote repository which removes `screxe.sh` from
your `PATH` (`/usr/local/bin`)


