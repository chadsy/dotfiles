# chadsy's dotfiles

These are factored along a couple of axes.

First, they're less about the 'what' and more about the 'why'. So there are two git-related files, one for normal shell init (e.g. normal shell aliases) and one for first-time machine setting up git (e.g. git system aliases, defaults). But generally, they're focused on the thing like `git` instead of the things like `aliases` or `functions` or `environment vars` etc.

Second, they're factored to follow the rules of macOS's shell initialization, around the `.bashrc` and `.bash_profile` with former calling `source...` on the latter to avoid duplication.

Finally, I'm no expert in best practices here. I do have a couple of fundamental values that guide me. I hate repeating things, I hate hardcoding things, I hate having things scattered hither-and-yon if they're all things of a feather. So I optimize for consolidation and parameterization.

* Should I open a separate folder for .plist files?

Caveats:

* I'll always split files into pieces intended to run on every shell vs on one-time installation.
* I'll usually split files into pieces that are bash- or zsh-specific, vs shared for both (e.g. alises)
* At some point, I might implement scripts that dynamically edit things, which means I might need to refactor these again.
