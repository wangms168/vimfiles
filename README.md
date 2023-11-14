# 安装目录
## 1、windows系统
```
git clone https://github.com/wangms168/nvim.git %LOCALAPPDATA%\nvim

为了使Gvim和Neovim共享一套配置. 配置文件一概使用Neovim的配置目录C:\Users\%USERNAME%\AppData\Local\nvim, 
其中的配置文件有init.vim和ginit.vim. 然后通过下列命令为Gvim创建配置文件的符号链接.

mklink C:\Users\%USERNAME%\_vimrc C:\Users\%USERNAME%\AppData\Local\nvim\init.vim
mklink /D C:\Users\%USERNAME%\vimfiles C:\Users\%USERNAME%\AppData\Local\nvim
```
## 2、linux系统
```
git clone https://github.com/wangms168/nvim.git ~/.vim/
建立配置文件vimrc的软连接：
ln -sf ~/.vim/_vimrc ~/.vimrc
```
