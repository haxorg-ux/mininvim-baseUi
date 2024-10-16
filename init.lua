require "options"
require "mappings"
require "commands"

-- put this in your main init.lua file ( before lazy setup )
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"

-- bootstrap plugins & lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim" -- path where its going to be installed

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

local plugins = require "plugins"

require("lazy").setup(plugins, require "lazy_config")

-- put this after lazy setup
-- dofile(vim.g.base46_cache .. "defaults")
-- dofile(vim.g.base46_cache .. "statusline")
-- dofile(vim.g.base46_cache .. "syntax")
-- dofile(vim.g.base46_cache .. "treesitter")

-- To load all integrations at once
for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
  dofile(vim.g.base46_cache .. v)
end
