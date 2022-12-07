# dotfiles

## Install Xcode

1. 更新 App Store。
2. 安裝 Xcode。
3. 開啟 Terminal，安裝 Xcode Command Line Tools:

```shell
xcode-select --install
```

## Install dotfiles

下載或使用 git clone 一份到 $HOME 目錄底下的 .dotfiles 資料夾裡面:

```shell
git clone https://github.com/lancerabbit/dotfiles.git ~/.dotfiles
```

進入 .dotfiles 資料夾:

```shell
cd ~/.dotfiles
```

安裝 dotfiles:

```shell
bash ./script/bootstrap.sh
```

## Git/ZSH

### ZSH

```shell
cp ~/.dotfiles/zsh/.zshrc .
```

### Git

```shell
cp ~/.dotfiles/git/.gitconfig .
```

## Vim

softlink folder `vim` and file `.vimrc`
softlink folder for nvim

```shell
ln -s ~/.dotfiles/vim ~/.config/nvim
```

## OS X defaults setting

執行 `$ ./osx/set-defaults.sh` 之後，會將 Mac OS X 的系統設置改變，細節參考下方說明 [Setting](Setting)

若修改過 osx/set-defaults.sh 之後，直接執行指令:

```shell
dot
```

### Setting

| setting                                        |
| ---------------------------------------------- |
| 關閉電池進入深入睡眠模式                       |
| 關閉電源進入深入睡眠模式                       |
| 加快視窗 resize 的速度(Cocoa applications)     |
| 預設展開儲存視窗                               |
| 關閉“你確定要開啟這個應用程式?”詢問視窗        |
| 關閉 Time Machine                              |
| 加速進入睡眠模式                               |
| 開啟觸控板輕觸點擊功能                         |
| 開啟觸控板/滑鼠右鍵選單功能                    |
| 開啟觸控板三指拖曳功能                         |
| 開啟觸控板四指向下滑出現 app expose 功能       |
| 加快觸控板/滑鼠的速度                          |
| 開啟全部視窗組件支援鍵盤控制                   |
| 關閉鍵盤按住的輸入限制                         |
| 加快鍵盤輸入                                   |
| 移除視窗截圖的影子                             |
| 預設 Finder 起始位置為下載資料夾               |
| 顯示副檔名                                     |
| 顯示 Finder 狀態列                             |
| 顯示 Finder 路徑列                             |
| 允許框選 Finde Quick Look 的文字               |
| Finder 標題列顯示完整路徑                      |
| 預設搜尋列的結果為當前目錄下                   |
| 關閉改變副檔名的警告提示                       |
| 開啟資料夾的 spring loading 功能               |
| 開啟 Dock 的 spring loading 功能               |
| 移除 spring loading 的延遲                     |
| 避免在 network volumes 底下建立 .DS_Store 檔案 |
| 使用 column view 作為 Finder 預設顯示選項      |
| 關閉清空垃圾桶的警告提示                       |
| 使用黑色的選單列和 Dock                        |
| 使用縮放的效果作為視窗放大縮小效果             |
| 應用程式縮小至自己的圖示                       |
| 顯示 Dock 應用程式開啟中的小亮燈提示           |
| 關閉 Dock 開啟應用程式的彈跳動畫               |
| 加快 Mission Control 的動畫速度                |
| 關閉 Mission Control 的應用程式群組化顯示      |
| 關閉 Dashboard                                 |
| 將 Dashboard 從多重桌面之中移除                |
| 自動隱藏 Dock                                  |
| 移除隱藏 Dock 的延遲                           |
| 移除 Dock 的顯示/隱藏動畫                      |
| 將隱藏的應用程式 Dock 圖示半透明顯示           |
