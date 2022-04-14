# Screxe

**Screxe**: An abbreviation of "script execute".
A remote repository containing a collection of useful scripts. These scripts are fetched from this remote when executed to ensure:
1. Scripts are always up to date when executed
2. Quick and easy to share scripts across clients/devices!

For ease of use, the `screxe.sh` script can be installed (locally) in the user's `PATH` (`/usr/local/bin`). It's used merely as shorthand to fetch other scripts.

## Example
With helper script (`sh` extension may be dropped):
```bash
screxe <scriptName>
```

Otherwise:
```bash
bash -l -c "$(curl -sfL https://raw.githubusercontent.com/BenShutt/Screxe/master/Scripts/<scriptName.sh>)"
```

## Scripts
[View scripts here](https://github.com/BenShutt/Screxe/tree/master/Scripts).

Redirected to a separate markdown for reuse in the `help.sh` script.

## Install
To install the helper script simply run:
```bash
bash -l -c "$(curl -sfL https://raw.githubusercontent.com/BenShutt/Screxe/master/install.sh)"
```
This will run the `install.sh` script on this remote repository which saves `screxe.sh` (as `screxe` executable) to
your `PATH` (`/usr/local/bin`)

## Uninstall
To uninstall the helper script simply run:
```bash
bash -l -c "$(curl -sfL https://raw.githubusercontent.com/BenShutt/Screxe/master/uninstall.sh)"
```
This will run the `uninstall.sh` script on this remote repository which removes `screxe.sh` (as `screxe` executable) from
your `PATH`

## Updates
The only thing that might need updating is the (local) `screxe.sh` shorthand script if this ever changes.
To reinstall, simply run the `install.sh` script because that performs an uninstall before executing the install.

