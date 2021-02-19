# Wellcome to the (n)vim side
This is my neovim configuration.\
Not the very best, but it's mine and i like it.\
Made as portable as I could, but still needs alot of external progrmas.\
Just kidding. Actually I don't like it, I edit it constatnly.\
*"No one ever accomplished anything by being content with who they were" - Adolin Kholin*

<p>
<img src="https://github.com/Rosen-Popov/nvim/blob/master/.img/nvim.png"  title="This is what peak performance looks like">
</p>

Coolorscheme : https://github.com/rafalbromirski/vim-aurora \
Airline colors : embark (comes with https://github.com/embark-theme/vim) 

## Initial setup
- [Neovim]
- or with a bootstap_env.sh (NYI but will do...at some point, maybe with compiling neovim-nightly)
- might add a version of this as a debian docker container, already configured and ready to go

### Needed external programs 
- **ripgrep** (also rust is needed)
- **nodejs**, npm, yarn
- python3-venv (or [ms-jpq/chadtree] wont work)
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
- **coc.vim** - Joint configuration for asyncomplete and coc (1)
- **colors.vim** - Lightline config and color theme
- **fzf.vim** - Fzf config stolen from the original repo, and modified slightly
- **linter.vim** - Ale is used for linter and this is where it's config resides
- **plugs.vim** - Here are all the plugin currently in use, 
- **settings.vim** - Editor settings for vim, mostly stolen from other vimrcs.
- **wm.vim** - rudamentary window managment, will probably become first plugin
- **stashed/**  - past configs for plugins i might come back to on a later date

 (1) if i figue out how to make coc display information to be more like \
 asyncomplete for nimslp (it has no documentation + suggestions are bland and same-y)

Press **F10**  in normal mode for a list of my custom keybinfings.

## Snippets support

There is support for snippets however you have to write them yourself.\
If you need to use them that is.\
But bindings are present in **repo_root/snippets/snippets.vim**\
Very easy to modify.\
For any language you need to put snippets in a folder named the result of **:echo &filetype** in vim.


## Useful links for more delving in
Quickstart for  [Neovim].

[Neovim]: https://www.linode.com/docs/guides/how-to-install-neovim-and-plugins-with-vim-plug/

[Vim way] configuration and what [vim can do], just like that.

[Vim way]: https://www.youtube.com/watch?v=DogKdiRx7ls
[vim can do]: https://www.youtube.com/watch?v=XA2WjJbmmoM
[ms-jpq/chadtree]:https://github.com/ms-jpq/chadtree
[First (n)vimrc], write your own, and steal form this one ;) .
[First (n)vimrc]: https://www.youtube.com/watch?v=DogKdiRx7ls

