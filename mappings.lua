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

    -- Normal Function keys: F1, F2, F3 ... F12
    -- Shift + Function keys F13, F14, F15 ... F24
    -- Control + Function keys: F25, F26, F27 ... F36
    -- Control + Shift + Function keys: F37, F38, F39 ... F48

    -- Quick Fix
    ["<F2>"] = { "<cmd>copen<cr>", desc = "open quickfix" },
    ["<F3>"] = { "<cmd>ccl<cr>", desc = "close quickfix" },

    -- OverseerRun
    ["<F4>"] = { "<cmd>w!<cr><cmd>OverseerRun<cr>", desc = "OverseerRun" },

    -- Debuger
    ["<F5>"] = { function() require("dap").toggle_breakpoint() end, desc = "Debugger: Toggle Breakpoint" },
    ["<F6>"] = { function() require("dap").continue() end, desc = "Debugger: Start" },
    ["<F18>"] = { function() require("dap").restart_frame() end, desc = "Debugger: Restart" }, -- Shift+F6
    ["<F7>"] = { function() require("dap").terminate() end, desc = "Debugger: Stop" },
    ["<F8>"] = { function() require("dap").step_over() end, desc = "Debugger: Step Over" },
    ["<F9>"] = { function() require("dap").step_into() end, desc = "Debugger: Step Into" },
    ["<F21>"] = { function() require("dap").step_out() end, desc = "Debugger: Step Out" }, -- Shift+F9

    -- Header/Source File Switch
    ["<F10>"] = { "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header File" },

    -- ToggleTerm
    ["<F12>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },

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
