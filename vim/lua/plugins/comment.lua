return {
  'numToStr/Comment.nvim',
  config = function()
    local status_ok, comment = pcall(require, "Comment")
    if not status_ok then
      return
    end

    comment.setup()

    local status_ok, ft = pcall(require, "Comment.ft")
    if not status_ok then
      return
    end

    ft.yaml = '#%s'
    ft.tf = '#%s'
  end
}
