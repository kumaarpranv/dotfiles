-- example using a list of specs with the default options
vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct
local ok, lazy = pcall(require, "lazy")
if not ok then
  return
end


lazy.setup({
  -- Packer can manage itself
  "wbthomason/packer.nvim",

  -- optimizations
  "lewis6991/impatient.nvim",

  -- tabs
  "nanozuki/tabby.nvim",

  -- session & projs
  {
    'rmagatti/auto-session',
  },
  --utils
  "nvim-lua/plenary.nvim",
  "ThePrimeagen/harpoon",
  "mbbill/undotree",
  "numToStr/Comment.nvim",
  "Yggdroot/indentLine",
  "windwp/nvim-autopairs",
  "mg979/vim-visual-multi",
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
  },
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",

  "xiyaowong/nvim-transparent",
  -- lsp
  { "nvim-treesitter/nvim-treesitter", cmd = "TSUpdate" },
  {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      { "jose-elias-alvarez/null-ls.nvim" },
      { "jay-babu/mason-null-ls.nvim" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },

      -- Snippets
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    }
  },
  "ray-x/lsp_signature.nvim",
  "glepnir/lspsaga.nvim",

  -- dap
  "mfussenegger/nvim-dap",
  "mfussenegger/nvim-dap-python",
  "leoluz/nvim-dap-go",
  "rcarriga/nvim-dap-ui",

  -- color themes
  "gruvbox-community/gruvbox",
  "EdenEast/nightfox.nvim",

  -- explorer
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   branch = "v2.x",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  --     "MunifTanjim/nui.nvim",
  --   }
  -- },

  -- icons
  "nvim-tree/nvim-web-devicons",

  -- statusline
  "nvim-lualine/lualine.nvim",

  -- fuzzy finding w/ telescope
  "nvim-telescope/telescope.nvim",   -- fuzzy finder
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build =
    "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },
  {
    'rmagatti/session-lens',
    requires = { 'rmagatti/auto-session', 'nvim-telescope/telescope.nvim' },
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
  -- toggleterm
  { "akinsho/toggleterm.nvim",         version = "*" },

  -- git
  "lewis6991/gitsigns.nvim",
  { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },

  -- motions
  "ggandor/leap.nvim",
  "nvim-pack/nvim-spectre"
})
