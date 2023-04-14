local lsp_ok, lsp = pcall(require, "lsp-zero")
if not lsp_ok then
  return
end

local null_ok, null_ls = pcall(require, "null-ls")
if not null_ok then
  return
end

null_ls.setup({})

lsp.preset('recommended')
lsp.setup_servers({
  'tsserver',
  'eslint',
  'jedi_language_server',
  'gopls',
  'lua_ls',
  'clangd',
  'svelte',
  'rust_analyzer',
  'tailwindcss',
  'tsserver',
  'eslint'
})

lsp.nvim_workspace()

-- Fix Undefined global 'vim'
-- lsp.configure('sumneko_lua', {
--   settings = {
--     Lua = {
--       diagnostics = {
--         globals = { 'vim' }
--       }
--     }
--   }
-- })


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
    vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = vim.lsp.buf.document_highlight,
      buffer = bufnr,
      group = "lsp_document_highlight",
      desc = "Document Highlight",
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      callback = vim.lsp.buf.clear_references,
      buffer = bufnr,
      group = "lsp_document_highlight",
      desc = "Clear All the References",
    })
  end

  if client.name == "eslint" then
    vim.cmd.LspStop('eslint')
    return
  end

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gw", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "gf", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "g]", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "g[", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "gc", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "grr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp.setup()

local mason_nullls = require("mason-null-ls")
mason_nullls.setup({
  automatic_installation = true,
  automatic_setup = true,
  ensure_installed = { "black" }
})
-- mason_nullls.setup_handlers({})

vim.diagnostic.config({
  virtual_text = true,
})
