return {
  -- disable trouble
  -- { "folke/edgy.nvim", enabled = false },
  -- { "echasnovski/mini.animate", enabled = false },
  -- { "sphamba/smear-cursor.nvim", enabled = false },
  {
    "snacks.nvim",
    opts = {
      -- indent = {
      --   scope = { enabled = false },
      -- },
      -- 需要調整設定，不然會遇到 cursor 移動太快時，會遇到延遲的 bug
      -- 當移動太快時，cursor 會突然跳回到最上方
      scroll = { enabled = false },
    },
  },
}
