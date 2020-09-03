#Wellcome to the vim side
##Inroduction 
This is my neovim configuration.
Made as portable as I could, but still needs alot of external progrmas.
Not the very vest, but it's mine and i like it.


#Initial setup
https://www.linode.com/docs/tools-reference/tools/how-to-install-neovim-and-plugins-with-vim-plug/


#Needed external programs 

fzf
ripgrep
Gnu Global + Ctags
various language servers
with existing supprt for nimlang c/c++/obj-c and python 

#Configuraton is split into several files all(most) in configs

##**auto.vim**
### Auto commands, currenty only one that install new plugins and clears old ones.
##**settings.vim**
### Editor settings for vim, mostly stolen from other vimrcs.
##**basic.vim**
### Basic plugin settings, here i put plugins that need at most 2-3 lines of config.
##**lsp_and_compl.vim**
### Language server and Asynccomplete settings currently have nimlsp, 
###pyls,and ccls as default servers.
##**plugs.vim**
### Here are all the plugin currently in use, 
### maybe half ofthem can be thrown away, who knows.
##**linter.vim**
### Ale is used for linter and this is where it's config resides/
##**cmd.vim**
### Some mappings that I have. 
