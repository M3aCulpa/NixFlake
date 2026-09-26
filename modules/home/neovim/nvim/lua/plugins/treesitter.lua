return {
  {
    -- highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    depends = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    enabled = true,
    dev = true,
    build = ':TSUpdate',
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    event = { "VeryLazy" },
    init = function()
      require("nvim-treesitter.query_predicates")
    end,
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        -- don't install missing parsers on buffer enter
        auto_install = false,
        -- off to quiet lsp
        ignore_install = {},
        -- off to quiet lsp
        modules = {},
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
}
