# Screxe
**Screxe**: An abbreviation of "script execute".
A remote repository of useful scripts. These scripts are fetched from this remote when executed so that:
1. Scripts are always up to date when executed
2. Quick and easy to use scripts across various clients

For ease of use, the `screxe.sh` script can be installed (locally) in the user's `PATH` (`/usr/local/bin`).
This script is merely shorthand to fetch and run other scripts.

## Usage
With helper script (`sh` extension may be dropped):
```bash
screxe <scriptName>
```

Otherwise:
```bash
bash -l -c "$(curl -sf https://raw.githubusercontent.com/BenShutt/Screxe/master/Scripts/<scriptName.sh>)"
```

## Scripts
Please see the scripts in the [Scripts directory](https://github.com/BenShutt/Screxe/tree/master/Scripts).
This has a separate markdown for reuse in the `help.sh` script.

## Install
To install the helper script simply run:
```bash
bash -l -c "$(curl -sf https://raw.githubusercontent.com/BenShutt/Screxe/master/install.sh)"
```

This will run the `install.sh` script which saves `screxe.sh` (as `screxe` executable) to
your `PATH` (`/usr/local/bin`).

## Uninstall
To uninstall the helper script simply run:
```bash
bash -l -c "$(curl -sf https://raw.githubusercontent.com/BenShutt/Screxe/master/uninstall.sh)"
```

This will run the `uninstall.sh` script which removes `screxe.sh` (as `screxe` executable) from
your `PATH`.

## Updates
The only thing that may need updating is the (local) `screxe.sh` helper script (as `screxe` executable) if this ever changes.
To reinstall, simply run the `uninstall.sh` script followed by the `install.sh` script.

