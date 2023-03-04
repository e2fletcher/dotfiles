local actions = require('telescope.actions')

require('telescope').setup({
  defaults = {
    file_ignore_patterns = { "^public/", "^node_modules/", "^target/", "^build/", "^dist/" },
    prompt_prefix = "   ",
    selection_caret = " ",
    entry_prefix = " ",
    selection_strategy = "reset",
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
    },
    media_files = {
      filetypes = { "png", "webp", "jpg", "jpeg" },
    },
  },
  pickers = {
    buffers = {
      sort_lastused = true,
      mappings = {
        i = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
        },
        n = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
        }
      }
    }
  }
});

local builtin = require("telescope.builtin")

builtin.project_files = function()
  local opts = {
    show_untracked = true,
  } -- define here if you want to define something
  vim.fn.system("git rev-parse --is-inside-work-tree")
  if vim.v.shell_error == 0 then
    builtin.git_files(opts)
  else
    builtin.find_files(opts)
  end
end

vim.keymap.set("n", "<leader>f", builtin.project_files, {})
vim.keymap.set("n", "<leader>g", function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>b", builtin.buffers, {})
-- vim.keymap.set("n", "<leader>f", function()
--   return vim.lsp.buf.format({ async = true })
-- end, {})

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require("telescope").load_extension("ui-select")
