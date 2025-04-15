-- ~/.config/nvim/lua/marcokist/remap.lua
-- Configuração de mapeamentos de teclas para Neovim

-- Definir líder global
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Salvar e sair
map("n", "<leader>w", ":w<CR>", { desc = "Salvar arquivo" })
map("n", "<leader>q", ":q<CR>", { desc = "Fechar Neovim" })

----------------------------------------------------------
-- Mapeamento específico do Explorador de Arquivos (Netrw)
----------------------------------------------------------
map("n", "<leader>pv", vim.cmd.Ex, {
  desc = "Abrir explorador de arquivos (Netrw)",
  -- Opções específicas:
  noremap = true,
  silent = false  -- Mostrar comando para feedback visual
})

----------------------------------------------------------
-- Mapeamentos avançados
----------------------------------------------------------

-- Mover linhas selecionadas para cima/baixo em modo visual
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Centralizar busca
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Preservar conteúdo do registro de colagem
map("x", "<leader>p", "\"_dP", { desc = "Colar sem sobrescrever registro" })

----------------------------------------------------------
-- Plugins (exemplo)
----------------------------------------------------------
-- Se usar telescope.nvim
map("n", "<leader>ff", function()
  require("telescope.builtin").find_files()
end, { desc = "Encontrar arquivos" })

-- Se usar nvim-tree.lua
map("n", "<leader>e", function()
  require("nvim-tree.api").tree.toggle()
end, { desc = "Alternar Nvim-Tree" })
