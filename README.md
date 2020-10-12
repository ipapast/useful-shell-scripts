# useful-shell-scripts

This repo includes simple scripts that can be re-used in the future.

How to run a script from any directory:

You will need to create a symlink to that file, e.g.:
```
sudo ln -s "{pwd}/my-script.sh /usr/bin/my-script"
```
Then you can run this from anywhere by typing: 
```
my-script
```
## Linting shell files

A useful tool is **shellcheck** which lives in this repo https://github.com/koalaman/shellcheck
If you install it locally on your laptop you will be able to use it for linting shell files on the go or by running `shellcheck my-script`

## Testing shell files

https://github.com/bats-core/bats-core 
