local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- LazyVimを追加して、プラグインをインポートする
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- プラグインを上書きする
    { import = "plugins" },
    -- TypeScriptの設定
    { import = "lazyvim.plugins.extras.lang.typescript" },
  },
  defaults = {
    -- デフォルトでは、LazyVimプラグインのみが遅延ロードされる
    lazy = false,
    -- 常に最新のgitコミットを使用する
    version = false,
    -- semverをサポートするプラグインの最新の安定版をインストールする
    -- version = "*",
  },
  install = { colorscheme = { "habamax" } },
  -- プラグインの更新を自動的にチェックする
  checker = { enabled = true },
  performance = {
    rtp = {
      -- いくつかのプラグインを無効化する
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  opts = {
    colorscheme = "gruvbox",
  },
})
