# Wellcome to the (n)vim side
This is my neovim configuration.\
Made as portable as I could, but still needs a lot of external programs.\
Not the very best, but it's mine and i like it.\
Just kidding. Actually I don't like it and I edit it constantly.

*"No one ever accomplished anything by being content with who they were"* - Adolin Kholin

## Why vim?
 - Light - Fast, responsive and light
 - Extendable - either ad-hoc durring runnig with macros, or by a script file.
 - Portable - most platforms have it.
 - Keymap - makes more sense once you get used to it. Defining your own is very
   easy
 - Customizability - Has a larger breadth of plugins. And vim has a very strong
   barebones toolset.
 - Better than VS Code - Harder to get it to commit die while running

## Main goal
I want an editor that I understand, it's intuitive to use, and i can script on
my own. That way I'm not bound by what exists and what doesnt as a plugin, and
can make my own fnctionality(given some amount of time). This config is includes
specific tools for wrinting C, Nim and Rust.

## Screenshots

- Splash scren. Giga cursed ist't it.
<img src="https://github.com/Rosen-Popov/nvim/blob/master/.img/init.png"  title="This is what peak performance looks like">

- Build integration and documentation preview. Can preview whole files.
<img src="https://github.com/Rosen-Popov/nvim/blob/master/.img/build.png"  title="Hover definition">

- Lsp with fuzzy search. Bet your electron ide cant do that.
<img src="https://github.com/Rosen-Popov/nvim/blob/master/.img/lsp.png" title="Electron-based more like electron-cringe">

- If vim knows haw to interpret "include" statements and it can search all the files in a tree. And then search for that token.
<img src="https://github.com/Rosen-Popov/nvim/blob/master/.img/inc_search.png" title="Basic vim is useful.No lsp.">

- Startuptime on my x270 Thinkpad
<img src="https://github.com/Rosen-Popov/nvim/blob/master/.img/startup.png" title="Sanic speed">

- Tree based undo that persists between sessions. Spell completion and spellcheck.
<img src="https://github.com/Rosen-Popov/nvim/blob/master/.img/prose.png"  title="Tree undo is best undo">

- Custom tmux status bar script. Shows time, ram, cpu load, free disk space, and battery percent and how long until full charge or empty.
<img src="https://github.com/Rosen-Popov/nvim/blob/master/.img/pc_status.jpg"  title="Tmux status bar">

## Other features not shown
- Git client(s)
- Quick jump to terminal (spawn,close current one with one binding)
- File management - netrw is surprisingly robust or nvim-tree
- Snippets (through a plugin)

## Initial setup
Besides a working neovim and proper proxy setup, no other setup is needed.
Neovim incliudes the lsp client, and the package manager bootstraps itself.

### Needed external programs
- **ripgrep** as telescope needs it. Easiest to install with rusts's cargo

## Configuration is split into several files (call other files ofc)
- auto.lua - Autocommands
- colors.lua - Colorscheme and statusline 
- keymaps.lua - Keymaps
- navigation.lua - Telescope and oter navigaion-type things
- documentation.lua - Venn adn neogen setup
- mcmp.lua - Lsp and and things that can be considered language tooling
- performance.lua - Segregated the plugin that optimizes lua into byte code
- settings.lua - Basic editor settings for vim
- utils/ - Some utilities that I have made

## Bespoke functionality outside plugins
- build_helper.lua - Build system helper 
A util modifies/and remembers build commands for specific projects or classes of
projects. A wrapper agound the builtin `:make` or `:Make` from [vim-dispatch]
- terminal_manager.vim - A terminal managment helper
A terminal managment helper to spawn/bring up a terminal, and just keep one
open.
- ref.vim - A set of functions around the `:include` feature
- utils.vim - Some vimscipt funcions for quality of life
    - Redir - redirect vim command output to curretn buffer
    - ExecuteMacroOverVisualRange - Executes a macro over last visual reange
    - VBlockNorm - executes a normal mode command sequence ver a block of visual
      selection
    - g:LToggle - toggles location list
    - RemoveQFItem - remove item properly from qf list
    - ChangeInMotion - change word under cursor in a region selected via vim
      motion. Or word from search register in visual mode. Interactive select to
      what to change.
    - HighlightInMotion - searches for word under cursor in a region selected
      with a vim motion
- lang.vim - a helper to enable switching between a predefined list of languages 
- status.lua - A custom statusline implementation


## Useful links for more delving in
Quickstart for [Neovim].
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
