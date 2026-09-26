local on_attach = function(_, bufnr)
  -- make :bd and :q behave normally while the tree is open
  vim.api.nvim_create_autocmd({'BufEnter', 'QuitPre'}, {
    nested = false,
    callback = function(e)
      local tree = require('nvim-tree.api').tree

      -- nothing to do if the tree is closed
      if not tree.is_visible() then
        return
      end

      -- count focusable windows (excluding e.g. the incline status window)
      local winCount = 0
      for _,winId in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_config(winId).focusable then
          winCount = winCount + 1
        end
      end

      -- quit: only one window besides the tree is left
      if e.event == 'QuitPre' and winCount == 2 then
        vim.api.nvim_cmd({cmd = 'NvimTreeClose'}, {})
        vim.api.nvim_cmd({cmd = 'quit'}, {})
      end

      -- :bd was probably issued and only the tree window is left
      -- behave as if the tree was closed (see `:h :bd`)
      if e.event == 'BufEnter' and winCount == 1 then
        -- avoids "Vim:E444: Cannot close last window"
        vim.defer_fn(function()
          -- close nvim-tree: will go to the last buffer used before closing
          tree.toggle({find_file = true, focus = true})
          -- re-open nvim-tree
          tree.toggle({find_file = true, focus = false})
        end, 10)
      end
    end
  })
end

return on_attach
