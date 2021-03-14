
# Wellcome to the (n)vim side
This is my neovim configuration.\
Not the very best, but it's mine and i like it.\
Made as portable as I could, but still needs alot of external progrmas.\
Just kidding. Actually I don't like it, I edit it constatnly.\
*"No one ever accomplished anything by being content with who they were"* - Adolin Kholin

<p>
<img src="https://github.com/Rosen-Popov/nvim/blob/master/.img/nvim.png"  title="This is what peak performance looks like">
</p>

## Initial setup
- [Neovim]
- or with a bootstap_env.sh (NYI but will do...at some point, maybe with compiling neovim-nightly)
- might add a version of this as a debian docker container, already configured and ready to go

### Needed external programs 
- **ripgrep** (also rust is needed)
- **nodejs, npm, yarn**
- **pynvim** for python support
- **python3-venv** (or [ms-jpq/chadtree] wont work)
- various language servers 
    - hasklell, 
    - nim (nimlsp , installed with nimble)
    - ccls(snap install for that, after trying to compile from source and failing)
    - rls
    - others are installed from coc

####  Current configurations for  
- **Nim-lang** witn nimsuggest and asyncomplete for completion and coc for anything else
- **Haskell**
- **C/C++** with ccls
- **Rust**(maybe)

## Configuraton is split into several files all(most) in configs
- **auto.vim** - Auto commands, currenty only one that install new plugins and clears old ones.
- **basic.vim** - Basic plugin settings, here i put plugins that need at most 2-3 lines of config.
- **cmd.vim** - Some mappings that I have.
- **open_utils.vim** - Some functions to open and execute text in visual selectionform vim
- **colors.vim** - Lightline config and color theme
- **fzf.vim** - Fzf config stolen from the original repo, and modified slightly
- **nvim-lsp.vim** - naovim native lsp configuration
- **lang.vim** - Language switching controls, switch up and down a list onf predetermined languages in init.vim <sup>(1)</sup>
- **plugs.vim** - Here are all the plugin currently in use, 
- **settings.vim** - Editor settings for vim, mostly stolen from other vimrcs.
- **wm.vim** - rudamentary window managment, will probably become first plugin
- **stashed/**  - past configs for plugins i might come back to on a later date

 <sup>(1) There are maybe better solutions for that, but this is using vim's builtin\
 keymaps feature, and changes input just for vim, and is independant of system\
 input language state (well, system has to be in english(as input) for vim to work)<sup>

Press **F10**  in normal mode for a list of my custom keybinfings.

## Snippets support

There is support for snippets however you have to write them yourself.\
If you need to use them that is.\
But bindings are present in **repo_root/snippets/snippets.vim**\
Very easy to modify.\
For any language you need to put snippets in a folder named the result of **:echo &filetype** in vim.


## Useful links for more delving in
Quickstart for [Neovim].

[Neovim]: https://www.linode.com/docs/guides/how-to-install-neovim-and-plugins-with-vim-plug/

[Vim way] configuration and what [vim can do], just like that. This is the way.\

[Vim way]: https://www.youtube.com/watch?v=DogKdiRx7ls
[vim can do]: https://www.youtube.com/watch?v=XA2WjJbmmoM
[ms-jpq/chadtree]:https://github.com/ms-jpq/chadtree 

