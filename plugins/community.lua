return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.colorscheme.tokyonight" },
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.code-runner.overseer-nvim" },
  {
    "overseer.nvim",
    config = function()
      local overseer = require("overseer")
        overseer.setup( {
          templates = {}
        })
        overseer.register_template({
          name = "clang build",
          builder = function()
          -- Full path to current file (see :help expand())
            local file = vim.fn.expand("%:p")
            return {
              cmd = { "clang", "-g", "-Wall", "-Werror", "-std=c11", "-fsanitize-recover=address" },
              args = { file },
              components = { { "on_output_quickfix", open = true }, "default" },
            }
          end,
          condition = {
            filetype = { "c" },
          }
        })
        overseer.register_template({
          name = "clang++ build",
          builder = function()
          -- Full path to current file (see :help expand())
            local file = vim.fn.expand("%:p")
            return {
              cmd = { "clang++", "-g", "-Wall", "-Werror", "-std=c11", "-fsanitize-recover=address" },
              args = { file },
              components = { { "on_output_quickfix", open = true }, "default" },
            }
          end,
          condition = {
            filetype = { "cpp" },
          },
        })
        overseer.register_template({
          name = "run a.out",
          builder = function()
          -- Full path to current file (see :help expand())
            return {
              cmd = { "./a.out" },
              components = {
                { "on_output_quickfix", set_diagnostics = true },
                "on_result_diagnostics",
                "default",
              },
            }
          end,
          condition = {
            filetype = { "c", "cpp" },
          },
        })
      end,
  },

  -- { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
}
