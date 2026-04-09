---
name: generate-git-commit
description: 專門用於生成 Git Commit Message 的技能。當使用者說「幫我寫 commit」、「產生 commit message」、「commit 要怎麼寫」、「git commit 建議」、「準備提交」、「整理暫存區」、或任何與 git commit、提交訊息相關的請求時，立即使用此技能。這個技能會自動讀取暫存區（staged）或異動檔案，產生符合 Conventional Commits 標準的中英文 commit message 建議。
---

# Git Commit Message 產生器

## 你的任務

根據當前 git 工作區的狀態，分析程式碼異動，產生**一到三個**符合專案風格的 commit message 建議，讓使用者選擇或修改。

---

## 第一步：收集 Git 狀態

依序執行以下指令取得完整的異動資訊：

1. **查看整體狀態**：了解哪些檔案已暫存、哪些未暫存

   ```bash
   git status
   ```

2. **取得暫存區的 diff**（優先使用，這是即將 commit 的內容）：

   ```bash
   git diff --cached --stat
   git diff --cached
   ```

3. **若暫存區為空，改取未暫存的異動**：

   ```bash
   git diff --stat
   git diff
   ```

4. **參考最近的 commit 風格**（了解專案慣例）：
   ```bash
   git log --oneline -10
   ```

---

## 第二步：分析異動內容

閱讀 diff 後，思考：

- **異動的本質是什麼？** 是新功能、bug 修復、重構、測試、文件更新、還是設定調整？
- **影響的範圍？** 是特定模組、服務、頁面？還是全域性的？
- **為什麼要做這個異動？** 從程式碼的修改方向推測目的
- **這個 commit 的邊界是否合理？** 一個 commit 只做一件事

若 diff 很大或包含多種不同性質的異動，可以提醒使用者考慮拆分 commit。

---

## 第三步：產生 Commit Message 建議

### 格式規則（Conventional Commits）

```
<type>(<scope>): <subject>

[optional body]

[optional footer]
```

**type 選擇：**
| type | 使用時機 |
|------|---------|
| `feat` | 新增功能 |
| `fix` | 修復 bug |
| `chore` | 維護性工作（不影響產品邏輯，如 CI、依賴更新） |
| `refactor` | 重構（不新增功能、不修 bug） |
| `test` | 新增或修改測試 |
| `docs` | 文件更新 |
| `style` | 程式碼格式調整（不影響邏輯） |
| `perf` | 效能優化 |
| `revert` | 還原先前的 commit |

**scope（可選）：**

- 用小括號包住，表示影響範圍
- 例如：`(auth)`、`(analytics)`、`(api)`、`(admin)`
- 若異動跨多個 scope，可省略或用最主要的

**subject 撰寫原則：**

- 使用英文，動詞開頭（祈使句），例如 `add`、`fix`、`remove`、`update`
- 不超過 72 個字元
- 首字母小寫，結尾不加句號
- 清楚描述「做了什麼」，而不只是「改了哪個檔案」

### 輸出格式

提供 1-3 個選項，依建議程度排序，每個選項包含：

- commit message（可直接複製使用）
- 一行說明這個選項的角度或重點

**範例輸出：**

```
## Git Commit Message 建議

根據你的異動（修改了 delete_organization_service.rb 和對應測試），以下是建議：

**選項 1（推薦）**
```

fix: handle missing records gracefully in delete organization service

```
> 著重在 bug 的修正行為，適合這個異動的主要意圖

**選項 2**
```

fix(danger_operation): prevent error when deleting organization with missing dependencies

```
> 加上 scope 標示影響模組，描述更具體

**選項 3（若這是功能改進而非 bug fix）**
```

refactor(danger_operation): improve error handling in delete organization flow

```
> 若主要目的是程式碼健壯性而非修 bug，可考慮此選項
```

---

## 特殊情境處理

### 只有 spec 檔案異動

```
test: add/update specs for <功能名稱>
```

### 多個不相關的異動混在一起

提醒使用者：

> 「這次異動包含了 X 和 Y 兩種不同的修改，建議拆成兩個 commit：
>
> 1. `feat: ...`（包含 A、B 檔案）
> 2. `fix: ...`（包含 C 檔案）
>    這樣 git history 會更清楚，code review 也更容易。」

### 暫存區為空

詢問使用者：

> 「目前暫存區沒有檔案。請問你想要：
>
> 1. 先 `git add` 特定檔案後再生成建議？
> 2. 根據所有未暫存的異動生成建議？」

### Merge commit 或 WIP

若看到像是 merge 或 work-in-progress 的情況，適時提醒使用者確認這是否是最終要提交的狀態。

---

## 注意事項

- **不要自動執行 `git add` 或 `git commit`**，只提供建議，讓使用者自己決定
- 若使用者說「直接幫我 commit」，確認後才執行
- 參考 `git log` 的風格——若專案習慣不加 scope，就不強制加；若習慣用中文，也可提供中文版本
