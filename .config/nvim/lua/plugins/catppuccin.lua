return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  config = function()
    require("catppuccin").setup({
      auto_integrations = true,
    })

    vim.cmd("colorscheme catppuccin-mocha")
  end,
}

