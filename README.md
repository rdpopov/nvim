# Wellcome to the (n)vim side
This is my neovim configuration.\
Made as portable as I could, but still needs a lot of external programs.\
Nix helps with that.
Not the very best, but it's mine and i like it.\
Just kidding. Actually I don't like it and I edit it constantly.

*"No one ever accomplished anything by being content with who they were"* - Adolin Kholin

## Why vim?
 - **Speed** - It is way faster and lighter than any ide I have used.
     Blows past anything in written with electron, and smokes heavier stuff, too.

 - **Power** - (n)vim's commands may seem strange at first. But they are more of
    a language. than simple commands. And  you can always write your own

 - **Customizability** - Make (n)vim the editor you want. It takes time,
    but so does learning any other tool. But with great power comes great customization time

 - **Extendability** - Vim is less bare bones than it looks. It is a clean slate
    at the beginning. It has a lot of powerful functionality built into it. Like
    searching all included files and finding definitins and uses in them or the
    :make integration. It can do a lot on its own, but there are also plugins for
    it from the vim community.

 - **Keymap** - The normal (vscode or the ISO standard that is present almost
    everywhere) shortcuts are somewhat long or similar functions are at opposite
    ends of the keyboard, or make no sense at all. Vim being modal, modes act as
    modifiers to a command, and combinations are shorter on average. Also
    commands behave more like verbs and can be chained for insane results. Basic
    keymap uses mnemonics, and everything is remapable. Movement commands are
    superb. There is more variety of movement commands and are more efficient at
    little movements.

 - **Portable** - I keep my vim config in a git so its easy to set it up almost
    anywhere. I have it running (mostly on my phone), On work and personal
    machines, or a new machine can be up and ready in a few minutes and ready
    for work.

## Main goal
The main goal for this configuration was to be able to have a neovim config\
for writing in [nim-lang] or any other language but nim in particular.\
And have completion like vscode has, but lighter, faster. Also more generic.

[nim-lang]:https://nim-lang.org/

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
- Snippets
- and what else do you need?

## Initial setup
- [Neovim], vimplug not needed it's put in the local autolaod directory, instead of the global system directory.
- Currently there is a something of a setup script based on [Nix] for some packages. Refer to [rdpopov/env] for that script

### Needed external programs 
- **ripgrep** as telescope needs it. Easiest to install with rusts's cargo or
    through [rdpopov/env]

## Configuration is split into several files (call other files ofc)
- cfg_autocmd.lua - Autocommands
- cfg_colors.lua - Colorscheme and statusline 
- cfg_commands.lua - Keymaps
- cfg_dash.lua - Custom dashboard config (cursed)
- cfg_ftree.lua - Nvimtree and other things files config
- cfg_navigation.lua - Telescope and zen config
- cfg_notes.lua - Vimwiki and Venn(diagrams) config
- cfg_nvimlsp.lua - Lsp and nvim-cmp config
- cfg_performance.lua - Segregated the plugin that optimizes lua into byte code
- cfg_settings.lua - Basic editor settings for vim
- cfg_utils.lua - Some basic utils I've made

- **stashed/**  - past configs for plugins i might come back to on a later date
- **patches/**  - sometimes you have to patch plugins yourself. (not used)

## My vimscript implementation for some somewhat basic things
- **functions/open_utils.vim** - Some functions to open and execute text in visual selection from vim
- **functions/ref.vim** - integrate location lists with builtin include search
- **functions/lang.vim** - Language switching controls, switch up and down a list of predetermined languages in init.vim <sup>(1)</sup>
- **functions/around.vim** - a try of making a sensible implementation of placing characters around things , not yet fully ready <sup>(2)</sup>
- **functions/terminal_manager.vim** - a set of functions to manage terminal splits
- **configs/colors.vim** - implementation of lightline, not mine, source is in file

 <sup>(1) There are maybe better solutions for that, but this is using vim's builtin\
 keymaps feature, and changes input just for vim, and is independant of system\
 input language state (well, system has to be in english(as input) for vim to work)</sup>

 <sup>(2) I am aware that there is the vim surround by tpope, I would use it, BUT\
 I want to have something that is not dependant of plugins, as I consider it to be a\
 somewhat basic functionality</sup>

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
