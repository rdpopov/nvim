# Wellcome to the (n)vim side
This is my neovim configuration.\
Made as portable as I could, but still needs alot of external progrmas.\
Not the very best, but it's mine and i like it.\
Just kidding. Actually I don't like it, I edit it constatnly.

## Initial setup
- https://www.linode.com/docs/tools-reference/tools/how-to-install-neovim-and-plugins-with-vim-plug/
- or with a bootstap_env.sh (NYI but will do)

### Needed external programs 
- **fzf** (go-lang) (will install itself)
- **ripgrep** (rust)
- **Gnu Global** + Ctags
- **nodejs**
- various language servers 

####  Current configurations for  
- **C/C++** with ccls 
- **Python** with pyls
- **Nim-lang** witn nimsuggest and nimlsp 
- **Go-lang** with gopls

## Configuraton is split into several files all(most) in configs
- **auto.vim** - Auto commands, currenty only one that install new plugins and clears old ones.
- **basic.vim** - Basic plugin settings, here i put plugins that need at most 2-3 lines of config.
- **cmd.vim** - Some mappings that I have. Press Alt + h to see all of them
- **fzf.vim** - Fzf config stolen from the original repo, and modified slightly
- **linter.vim** - Ale is used for linter and this is where it's config resides
- **lsp_and_compl.vim** - Loads basic vimlsp config and then loads specific configs for specific languages
- **lsp_configs** - Holds vimlsp and asyncomplete configurations basic and specific
- **nerdtree.vim** - Nerdtree configuration
- **plugs.vim** - Here are all the plugin currently in use, 
- **settings.vim** - Editor settings for vim, mostly stolen from other vimrcs.

## Snippets support

There is support for snippets however you have to write them yourself.\
If you need to use them that is.\
But bindings are present in **repo_root/snippets/snippets.vim**\
Very easy to modify.\
For any language you need to put snippets in a folder named the result of **:echo &filetype** in vim
