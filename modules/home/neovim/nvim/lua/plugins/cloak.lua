-- masks values matching patterns; good for presentations
return {
  'laytan/cloak.nvim',
  enabled = true,
  keys = {
    { '<leader>ct',     "<cmd>CloakPreviewLine<CR>",   desc = 'Cloak: [C]loak [T]oggle state' },
    { '<leader>cp',     "<cmd>CloakPreviewLine<CR>",   desc = 'Cloak: [C]loak [P]review line under cursor' },
    { '<leader>ce',     "<cmd>CloakEnable<CR>",        desc = 'Cloak: [C]loak [E]nable' },
    { '<leader>cd',     "<cmd>CloakDisable<CR>",       desc = 'Cloak: [C]loak [D]isable' },
  },
  config = function()
    require("cloak").setup({
        enabled = true,
        cloak_character = "*",
        -- highlight group for cloaked text, see `:h highlight`
        highlight_group = "Comment",
        patterns = {
            {
                -- match any file starting with ".env"; can be a table of patterns
                file_pattern = {
                    "*.enc.yaml",
                    ".env*",
                },
                -- match an equals sign and everything after it; can be a table of patterns,
                -- example: cloak_pattern = { ":.+", "-.+" } for yaml files.
                cloak_pattern = { "=.+", ":.+", "-.+" }
            },
        },
    })
end
}
