# dotfiles

These are defined with a few principles in mind. I'm no expert in unix/linux but I do have a decent idea of some rules that make sense and help make decisions in order to increase understanding and maintainability.

First, they're less about the 'what' and more about the 'why'. So there are two git-related files, one for normal shell init (e.g. normal shell aliases) and one for first-time machine setting up git (e.g. git system aliases, defaults). But generally, they're focused on the thing like `git` instead of the things like `aliases` or `functions` or `environment vars` etc.

Second, they're factored to follow the rules of macOS's shell initialization, around the `.bashrc` and `.bash_profile` with former calling `source...` on the latter to avoid duplication.

Finally, I'm no expert in best practices here. I do have a couple of fundamental values that guide me. I hate repeating things, I hate hardcoding things, I hate having things scattered hither-and-yon if they're all things of a feather. So I optimize for consolidation and parameterization.

* I'll always split files into pieces intended to run at different times, e.g. on every shell vs on one-time installation.
* I'll usually split files into pieces that are bash- or zsh-specific, vs shared for both (e.g. alises)
* At some point, I might implement scripts that dynamically edit things, which means I might need to refactor these again.
* For apps that support setting a location for their config, I have pointed them at a folder in `~/Dropbox`.
* For apps that natively store their configs in `~/.foo` or `~/Library/Preferences/foo.plist` or similar, I've experimented with replacing them with symlinks to move the files into the `./apps` folder. Some, alas, do not respect this.

# TODO

* get a shitload of defaults from macos to  capture all the various system preferences that I've accumulated over the years. I suppose the key here is to follow my heart on config-as-code, so capture the ones I care about and periodically extract them from `defaults read` and compare against baseline. Alex Popp's [collection](https://github.com/alxppp/dotfiles/blob/master/macos/set-defaults.sh) has a remarkable collection.
* Should I open a separate folder for .plist files?
* Check all the symlinks in /usr/local/bin to see what's been installed

# some dotfile resources

* [Zach Holman](https://github.com/holman/dotfiles) Good overall breadth, and some structural and automation tools. Particular focus on docker, git, macos, system.
* [Alex Popp](https://github.com/alxppp/dotfiles) Really broad collection, worth looking at overlap with my apps (sublime, vscode, xcode, macos, etc), with lots of /functions, and zsh symlinks across the board
* [Jeff Geerling](https://github.com/geerlingguy/dotfiles)

# some prompt resources

* https://misc.flogisoft.com/bash/tip_colors_and_formatting
* https://tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
* https://www.lihaoyi.com/post/BuildyourownCommandLinewithANSIescapecodes.html
* https://gist.github.com/loudambiance/a41b42a4295bce6e7304
* https://gist.github.com/natelandau/10654137
* https://github.com/nojhan/liquidprompt

## Raw stuff

```bash
# I wrote the following for my zu shell, maybe there's a way to refactor it for github + gitlab to support their APIs, looking at the repo's origin url, and going from there...
function gitcurl() {
    if [[ "$1" == "help" ]]; then
        echo "gitcurl - sends the command line to gitlab at the end of /api/v4"
        echo "          and runs it thru python3 json tool to prettify it."
        echo ""
        echo common uses:
        echo "   /version (shows gitlab version)"
        echo "   /user/406 (shows Chad's user info)"
        echo "   /groups/445 (shows catalog team's repos)"
        echo ""
        echo "You can add ?per_page=100 to get more back"
        echo ""
        return 1
    fi

    curl -s --header "PRIVATE-TOKEN: $(gitlabToken)" "https://gitlab.corp.zulily.com/api/v4"$@
}
```
