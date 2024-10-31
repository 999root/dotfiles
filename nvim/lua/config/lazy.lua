local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- Bootstrap lazy.nvim
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

vim.opt.termguicolors = true -- Enable true color support
vim.cmd("set background=dark") -- Set background to dark

local function null_notify() end

require("lazy").setup({
  spec = {
    -- Add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- Import/override with your plugins
    { import = "plugins" },

    -- Add the Tree-sitter plugin
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        require("nvim-treesitter.configs").setup {
          ensure_installed = "all", -- Install all available parsers
          sync_install = false,     -- Install parsers asynchronously
          auto_install = true,      -- Automatically install missing parsers
          highlight = {
            enable = true,                   -- Enable highlighting
            additional_vim_regex_highlighting = false, -- Disable Vim's regex highlighting
          },
          modules = {"nvim"}, -- Not usually required
          ignore_install = {}, -- List of parsers to ignore during installation
        }
      end
    },

    -- Add the TokyoNight colorscheme with transparency options
    {
      "folke/tokyonight.nvim",
      opts = {
        transparent = true, -- Enable transparency
        styles = {
          sidebars = "transparent", -- Set sidebars to be transparent
          floats = "transparent",    -- Set floats to be transparent
        },
      },
      config = function()
        require("tokyonight").setup({
          transparent = true,
          styles = {
            sidebars = "transparent",
            floats = "transparent",
          },
        })
        vim.cmd("colorscheme tokyonight") -- Set the colorscheme
      end,
    },
  },
  defaults = {
    lazy = false,            -- Load your custom plugins on startup
    log_level = "fatal",     -- Suppress all log messages except fatal
    notify = null_notify,     -- Prevent notifications from being displayed
    version = false,         -- Always use the latest git commit
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true }, -- Automatically check for plugin updates
  performance = {
    rtp = {
      -- Disable some runtime plugins
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
