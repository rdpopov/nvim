# Wellcome to the (n)vim side
This is my neovim configuration.\
Made as portable as I could, but still needs alot of external progrmas.\
Not the very best, but it's mine and i like it.\
Just kidding. Actually I don't like it and I edit it constatnly.

*"No one ever accomplished anything by being content with who they were"* - Adolin Kholin

## Why vim?
 - **Speed** - It is way faster and lighter than any ide I have used.\
     Blows past anything in written with electron, and smokes heavier stuff, too.
 - **Power** - (n)vim's commands may seem strange at first. But they are more of a language.\
   than simple commands. And  you can always write your own
 - **Customizablity** - Make (n)vim the edtior you want. It takes time,\
   but so does learing any other tool. But with great power comes great customization time
 - **Extendabilty** - Vim is less barebones than it looks. It is a clean slate at the beginning.\
   It has a lot of powerfull functionality built into it. Like include paths and :make\
   It can do a lot on its own, but there are also plugins for it fromm the vim community.
 - **Keymap** - The normal (vscode or the ISO standard that is present almost everywhere)\
   shortcuts are somewaht long or similar functions are at opposite ends of the keyboard, \
   or make no sense at all. Vim being modal, has more combinations per mode,\
   and combinations are shorter on average. Basic keymap uses mneumonics,\
   and everytinng is remapable. Movment commands are superb.\
   There is more variety of movment commands and are more efficient at little movments.
 - **Portable** - I keep my vim config in a git so its easy to set it up almost anywhere.\
   and I'm trying to make some things in vimscript as much as I can, so I have most\
   what I'm used to regardless of location(colorscheme, lightline, using netrw).
   It is made mainly for neovim since it uses lua for some things. But, neovim\ 
   has built in lsp support, so one less bulky dependancy to have.

## Main goal
The main goal for this configuration was to be able to have a neovim config\
for writing in [nim-lang] or any other language but nim in particualr.\
And have completion like vscode has, but lighter, faster. 

[nim-lang]:https://nim-lang.org/

<p>
<img src="https://github.com/Rosen-Popov/nvim/blob/master/.img/nvim.png"  title="This is what peak performance looks like">
</p>

<p>
<img src="https://github.com/Rosen-Popov/nvim/blob/master/.img/diagn.png"  title="Get all diagnostics">
</p>

<p>
<img src="https://github.com/Rosen-Popov/nvim/blob/master/.img/descr.png"  title="Hover definition">
</p>

<p>
<img src="https://github.com/Rosen-Popov/nvim/blob/master/.img/preview.png"  title="Preview definition with fzf">
</p>

<p>
<img src="https://github.com/Rosen-Popov/nvim/blob/master/.img/tree.png"  title="Tree undo is best undo">
</p>
## Features
- Git git gutter
- Visual git client (some things are faster than console)
- Build from within neovim(setup keybinds for that)
- Lsp support (also buffer, tag and dictionary based completion)
- Per project config
- Undo tree(like a small per file git also can brach)
- File managment - netrw is surprisingly robust
- and what else do you need?


## Initial setup
- [Neovim]
- or with a setup.sh (NYI but will do...at some point, maybe with compiling neovim-nightly)
- might add a version of this as a debian docker container, already configured and ready to go

### Needed external programs 
- **ripgrep** as fzf needs it ... sort of. can do it with grep but is easier with this

## Configuraton is split into several files all(most) in configs
- **auto.vim** - Auto commands, currenty only one that install new plugins and clears old ones.
- **around.vim** - A weak implementation for surround, have no visual mode
- **basic.vim** - Basic plugin settings, here i put plugins that need at most 2-3 lines of config.
- **cmd.vim** - Some mappings that I have.
- **colors.vim** -  ayu and other color stuff
- **fzf.vim** - Fzf config stolen from the original repo, and modified slightly
- **netrw.vim** - Config for netrw file browser. Surprisingly useful
- **nvim-lsp.vim** - neovim native lsp configuration
- **navigation.vim** - neovim native lsp configuration
- **plugs.vim** - Here are all the plugin currently in use, 
- **settings.vim** - Editor settings for vim, mostly stolen from other vimrcs.
- **lua/statusline.lua** - fancy Statusline in lua 
- **stashed/**  - past configs for plugins i might come back to on a later date
- **patches/**  - sometimes you have to patch plugins yourself.
- **tmux.conf** - this is my tmux configuration 

## My vimscript implemnetations for some somewaht basic things
- **functions/open_utils.vim** - Some functions to open and execute text in visual selectionform vim
- **finctions/lang.vim** - Language switching controls, switch up and down a list onf predetermined languages in init.vim <sup>(1)</sup>
- **functions/wm.vim** - rudamentary window managment, will probably become first plugin
- **functions/around.vim** - a try of making a sensibel implementaion of placing characters around things , not yet fully ready <sup>(2)</sup>
- **functions/status_line_utils.vim** - Functions used by statusline. 
- **configs/colors.vim** - implementation of lightline, not mine, source is in file

 <sup>(1) There are maybe better solutions for that, but this is using vim's builtin\
 keymaps feature, and changes input just for vim, and is independant of system\
 input language state (well, system has to be in english(as input) for vim to work)</sup>

 <sup>(2) I am aware that there is the vim surround by tpope, I would use it, BUT\
 I want to have something that is not dependant of plugins, as I consider it to be a\
 somewhat basic functionality</sup>

## My homebrew utils
I have had some defficulties with finding some things that I want as plugins.\
So I wrote my own. They are not anything grand or groundbraking,\
but they are useful which is more important for any code.\
Easily find them here [Code-Fragments/vimscript]

[Code-Fragments/vimscript]: https://github.com/rdpopov/Code-Fragments/tree/main/vimscript

## Useful links for more delving in
Quickstart for [Neovim].

[Neovim]: https://www.linode.com/docs/guides/how-to-install-neovim-and-plugins-with-vim-plug/

[Vim way] configuration and what [vim can do], just like that. This is the way.\

[Vim way]: https://www.youtube.com/watch?v=DogKdiRx7ls
[vim can do]: https://www.youtube.com/watch?v=XA2WjJbmmoM
[ms-jpq/chadtree]:https://github.com/ms-jpq/chadtree 

