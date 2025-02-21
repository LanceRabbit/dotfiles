return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({})

		vim.keymap.set("n", "<C-u>", [[:NvimTreeToggle<CR>]], {})
	end,
}

-- `<C-]>`           CD                         |nvim-tree-api.tree.change_root_to_node()|
-- `<C-e>`           Open: In Place             |nvim-tree-api.node.open.replace_tree_buffer()|
-- `<C-k>`           Info                       |nvim-tree-api.node.show_info_popup()|
-- `<C-r>`           Rename: Omit Filename      |nvim-tree-api.fs.rename_sub()|
-- `<C-t>`           Open: New Tab              |nvim-tree-api.node.open.tab()|
-- `<C-v>`           Open: Vertical Split       |nvim-tree-api.node.open.vertical()|
-- `<C-x>`           Open: Horizontal Split     |nvim-tree-api.node.open.horizontal()|
-- `<BS>`            Close Directory            |nvim-tree-api.node.navigate.parent_close()|
-- `<CR>`            Open                       |nvim-tree-api.node.open.edit()|
-- `<Tab>`           Open Preview               |nvim-tree-api.node.open.preview()|
-- `>`               Next Sibling               |nvim-tree-api.node.navigate.sibling.next()|
-- `<`               Previous Sibling           |nvim-tree-api.node.navigate.sibling.prev()|
-- `.`               Run Command                |nvim-tree-api.node.run.cmd()|
-- `-`               Up                         |nvim-tree-api.tree.change_root_to_parent()|
-- `a`               Create File Or Directory   |nvim-tree-api.fs.create()|
-- `bd`              Delete Bookmarked          |nvim-tree-api.marks.bulk.delete()|
-- `bt`              Trash Bookmarked           |nvim-tree-api.marks.bulk.trash()|
-- `bmv`             Move Bookmarked            |nvim-tree-api.marks.bulk.move()|
-- `B`               Toggle Filter: No Buffer   |nvim-tree-api.tree.toggle_no_buffer_filter()|
-- `c`               Copy                       |nvim-tree-api.fs.copy.node()|
-- `C`               Toggle Filter: Git Clean   |nvim-tree-api.tree.toggle_git_clean_filter()|
-- `[c`              Prev Git                   |nvim-tree-api.node.navigate.git.prev()|
-- `]c`              Next Git                   |nvim-tree-api.node.navigate.git.next()|
-- `d`               Delete                     |nvim-tree-api.fs.remove()|
-- `D`               Trash                      |nvim-tree-api.fs.trash()|
-- `E`               Expand All                 |nvim-tree-api.tree.expand_all()|
-- `e`               Rename: Basename           |nvim-tree-api.fs.rename_basename()|
-- `]e`              Next Diagnostic            |nvim-tree-api.node.navigate.diagnostics.next()|
-- `[e`              Prev Diagnostic            |nvim-tree-api.node.navigate.diagnostics.prev()|
-- `F`               Live Filter: Clear         |nvim-tree-api.live_filter.clear()|
-- `f`               Live Filter: Start         |nvim-tree-api.live_filter.start()|
-- `g?`              Help                       |nvim-tree-api.tree.toggle_help()|
-- `gy`              Copy Absolute Path         |nvim-tree-api.fs.copy.absolute_path()|
-- `ge`              Copy Basename              |nvim-tree-api.fs.copy.basename()|
-- `H`               Toggle Filter: Dotfiles    |nvim-tree-api.tree.toggle_hidden_filter()|
-- `I`               Toggle Filter: Git Ignore  |nvim-tree-api.tree.toggle_gitignore_filter()|
-- `J`               Last Sibling               |nvim-tree-api.node.navigate.sibling.last()|
-- `K`               First Sibling              |nvim-tree-api.node.navigate.sibling.first()|
-- `L`               Toggle Group Empty         |nvim-tree-api.node.open.toggle_group_empty()|
-- `M`               Toggle Filter: No Bookmark |nvim-tree-api.tree.toggle_no_bookmark_filter()|
-- `m`               Toggle Bookmark            |nvim-tree-api.marks.toggle()|
-- `o`               Open                       |nvim-tree-api.node.open.edit()|
-- `O`               Open: No Window Picker     |nvim-tree-api.node.open.no_window_picker()|
-- `p`               Paste                      |nvim-tree-api.fs.paste()|
-- `P`               Parent Directory           |nvim-tree-api.node.navigate.parent()|
-- `q`               Close                      |nvim-tree-api.tree.close()|
-- `r`               Rename                     |nvim-tree-api.fs.rename()|
-- `R`               Refresh                    |nvim-tree-api.tree.reload()|
-- `s`               Run System                 |nvim-tree-api.node.run.system()|
-- `S`               Search                     |nvim-tree-api.tree.search_node()|
-- `u`               Rename: Full Path          |nvim-tree-api.fs.rename_full()|
-- `U`               Toggle Filter: Hidden      |nvim-tree-api.tree.toggle_custom_filter()|
-- `W`               Collapse                   |nvim-tree-api.tree.collapse_all()|
-- `x`               Cut                        |nvim-tree-api.fs.cut()|
-- `y`               Copy Name                  |nvim-tree-api.fs.copy.filename()|
-- `Y`               Copy Relative Path         |nvim-tree-api.fs.copy.relative_path()|
-- `<2-LeftMouse>`   Open                       |nvim-tree-api.node.open.edit()|
-- `<2-RightMouse>`  CD                         |nvim-tree-api.tree.change_root_to_node()|
