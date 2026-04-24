-- On définit notre touche leader sur espace
vim.g.mapleader = " "

-- Raccourci pour la fonction set
local keymap = vim.keymap.set

-- on utilise ;; pour sortir du monde insertion
keymap("i", ";;", "<ESC>", { desc = "Sortir du mode insertion avec ;;" })

-- on efface le surlignage de la recherche
keymap("n", "<leader>nh", ":nohl<CR>", { desc = "Effacer le surlignage de la recherche" })

-- I déplace le texte sélectionné vers le haut en mode visuel (activé avec v)
keymap("v", "<S-i>", ":m .-2<CR>==", { desc = "Déplace le texte sélectionné vers le haut en mode visuel" })

-- K déplace le texte sélectionné vers le bas en mode visuel (activé avec v)
keymap("v", "<S-k>", ":m .+1<CR>==", { desc = "Déplace le texte sélectionné vers le bas en mode visuel" })

-- I déplace le texte sélectionné vers le haut en mode visuel bloc (activé avec V)
keymap("x", "<S-i>", ":move '<-2<CR>gv-gv", { desc = "Déplace le texte sélectionné vers le haut en mode visuel bloc" })
-- K déplace le texte sélectionné vers le bas en mode visuel (activé avec V)
keymap("x", "<S-k>", ":move '>+1<CR>gv-gv", { desc = "Déplace le texte sélectionné vers le bas en mode visuel bloc" })

-- Changement de fenêtre avec Ctrl + déplacement uniquement au lieu de Ctrl-w + déplacement
keymap("n", "<C-h>", "<C-w>h", { desc = "Déplace le curseur dans la fenêtre de gauche" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Déplace le curseur dans la fenêtre du bas" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Déplace le curseur dans la fenêtre du haut" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Déplace le curseur dans la fenêtre droite" })

-- Navigation entre les buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

keymap("n", "<leader>fe", "<cmd>FlutterRun<cr>", { desc = "Lancer Flutter" })
keymap("n", "<leader>fr", "<cmd>FlutterReload<cr>", { desc = "Hot Reload" })
keymap("n", "<leader>fR", "<cmd>FlutterRestart<cr>", { desc = "Hot Restart" })
keymap("n", "<leader>fq", "<cmd>FlutterQuit<cr>", { desc = "Quitter Flutter" })
keymap("n", "<leader>fl", "<cmd>FlutterLogToggle<cr>", { desc = "Logs Flutter" })

vim.keymap.set('i', '<C-M-Left>', '<Esc>v<Left>', { desc = 'Sélectionner vers la gauche' })
vim.keymap.set('v', '<C-M-Left>', '<Left>', { desc = 'Étendre sélection gauche' })

vim.keymap.set('i', '<C-M-Right>', '<Esc>v<Right>', { desc = 'Sélectionner vers la droite' })
vim.keymap.set('v', '<C-M-Right>', '<Right>', { desc = 'Étendre sélection droite' })

vim.keymap.set('i', '<C-M-Up>', '<Esc><Up>', { desc = 'Déplacer curseur haut' })
vim.keymap.set('v', '<C-M-Up>', '<Esc><Up>', { desc = 'Sortir du visuel et monter' })

vim.keymap.set('i', '<C-M-Down>', '<Esc><Down>', { desc = 'Déplacer curseur bas' })
vim.keymap.set('v', '<C-M-Down>', '<Esc><Down>', { desc = 'Sortir du visuel et descendre' })
