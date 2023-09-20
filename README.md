# Wellcome to the (n)vim side
This is my neovim configuration.\
Made as portable as I could, but still needs a lot of external programs.\
Not the very best, but it's mine and i like it.\
Just kidding. Actually I don't like it and I edit it constantly.

*"No one ever accomplished anything by being content with who they were"* - Adolin Kholin
## Config was rewritten.
Config was rewritten to escape some of the drawback of the previous one. This
one is not as fancy but I believe easier to maintain. No more 1000 lines of code
for the statuslne. 

## Why vim?
I have been using vim as my edtior for a while now, and the power and
versatility it offers even as-is, is unparalleled. You dont need fancy IDEs and
LSPs to write or be productive around a codebase, even basic vim can be very
useful. Otherwise:
 - Light - Fast, responsive and light
 - Extendable - either ad-hoc during running with macros, or by a script file.
 - Portable - most platforms have it. I can even run it on my phone
 - Keymap - makes more sense once you get used to it.
 - Customizability - Has a larger breadth of plugins.

## Main goal
I want an editor that I understand, it's intuitive to use(yes, vim is
intuitive), and I can script on my own. That way I'm not bound by what exists
and what doesn't as a plugin, and can make my own functionality(given some amount
of time). 

## Main features
- Lsp integration 
- Spellcheck and spell completion
- Meld-like Diff tool 
- Git client(s)
- Quick jump to terminal - keep one shell on background
- File management - netrw is surprisingly robust or nvim-tree
- Snippets (through a plugin)
- Various utilities to edit text on top of what vim already has

## Initial setup
Clone and install ripgrep

## Bespoke functionality outside plugins
- build_helper.lua - Build system helper 
  A util modifies/and remembers build commands for specific projects or classes
  of projects. A wrapper around the builtin `:make` or `:Make` from
  [vim-dispatch]
- terminal_manager.vim - A terminal management helper
  A terminal management helper to spawn/bring up a terminal, and just keep one
open.
- utils.vim - Some vimscipt functions for quality of life
    -  ExecuteMacroOverVisualRange
       * executes a macro over all the line in visual selection
    -  VBlockNorm
       * executes a :norm command over all the lines of visual selection, kind of a shorthand
    -  RemoveQFItem
       * removes an item from qflist
    -  HighlightInMotion
       * invoke this and then a text object, ex : ssip - it will operate on the whole paragraph
       it will then prompt for a pattern that it will highlight in the scope. Aimed to be used with SimpleReplace
    -  SimpleReplace
       * will replace whatever is in the search register over the last visual selection
       * it can also split lines and uses sed under the hood so \0 can be used which makes it flexible
- lang.vim - a helper to enable switching between a predefined list of languages 
- status.lua - A custom statusline implementation

## Useful links for more delving in
Quick start for [Neovim].
Master the power of the dark [sed].
[Vim way] configuration and what [vim can do], just like that. This is the way.

[Neovim]: https://www.linode.com/docs/guides/how-to-install-neovim-and-plugins-with-vim-plug/
[Vim way]: https://www.youtube.com/watch?v=DogKdiRx7ls
[vim can do]: https://www.youtube.com/watch?v=XA2WjJbmmoM
[ms-jpq/chadtree]:https://github.com/ms-jpq/chadtree 
[Nix]: https://nixos.org/download.html
[rdpopov/env]: https://github.com/rdpopov/env
[sed]: https://linuxhint.com/sed-capture-group-examples/
[vim-dispatch]: https://github.com/tpope/vim-dispatch
