return {
  {
    'stevearc/oil.nvim',
    opts = {
      watch_for_changes = true,
      view_options = {
	show_hidden = true
      },
      preview = {
	min_width = 0.6,
      },
    },
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
  }
}
