-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },

    -- Swap Buffers
    ["H"] = { function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end, desc = "Previous buffer" },
    ["L"] = { function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next buffer" },

    -- Quick Fix
    ["<F2>"] = { "<cmd>copen<cr>", desc = "open quickfix" },
    ["<F3>"] = { "<cmd>ccl<cr>", desc = "close quickfix" },

    -- OverseerRun
    ["<F4>"] = { "<cmd>w!<cr><cmd>OverseerRun<cr>", desc = "OverseerRun" },

    -- Debug Start
    ["<F5>"] = { function() require("dap").continue() end, desc = "Debugger: Start" },
    ["<F17>"] = { function() require("dap").terminate() end, desc = "Debugger: Stop" }, -- Shift+F5
    ["<F29>"] = { function() require("dap").restart_frame() end, desc = "Debugger: Restart" }, -- Control+F5
    ["<F6>"] = { function() require("dap").pause() end, desc = "Debugger: Pause" },

    -- ToggleTerm
    ["<F7>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },

    -- Debugger
    ["<F9>"] = { function() require("dap").toggle_breakpoint() end, desc = "Debugger: Toggle Breakpoint" },
    ["<F10>"] = { function() require("dap").step_over() end, desc = "Debugger: Step Over" },
    ["<F11>"] = { function() require("dap").step_into() end, desc = "Debugger: Step Into" },
    ["<F23>"] = { function() require("dap").step_out() end, desc = "Debugger: Step Out" }, -- Shift+F11

    -- Split
    ["|"] = { "<cmd>vsp<cr>", desc = "Vertical Split" },
    ["\\"] = { "<cmd>sp<cr>", desc = "Horizontal Split" },
    ["sv"] = { "<cmd>vsp<cr>", desc = "Vertical Split" },
    ["sh"] = { "<cmd>sp<cr>", desc = "Horizontal Split" },
    ["sc"] = { "<C-w>c", desc = "Close Current Split" },
    ["so"] = { "<C-w>o", desc = "Close Other Split" },
    ["s<Left>"] = { "<C-w>h", desc = "Move to Left Split" },
    ["s<Right>"] = { "<C-w>l", desc = "Move to Right Split" },
    ["s<Up>"] = { "<C-w>k", desc = "Move to Up Split" },
    ["s<Down>"] = { "<C-w>j", desc = "Move to Down Split" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,

    -- For terminal clear
    ["<C-l>"] =false,
  },
}
