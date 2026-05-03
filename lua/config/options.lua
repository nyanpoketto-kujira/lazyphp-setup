-- OS Detection
local is_windows = vim.loop.os_uname().version:find("Windows")

-- Fix delay & Timeout
vim.o.updatetime = 200
vim.o.timeoutlen = 300
vim.o.ttimeoutlen = 10

-- Clipboard Optimization (Cross-platform)
vim.o.clipboard = "unnamedplus"

-- Disk I/O Optimization
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.undofile = true

if vim.g.neovide then
    -- Responsiveness
    vim.g.neovide_no_idle = true
    vim.g.neovide_refresh_rate = 60
    
    -- Font handling based on OS
    if is_windows then
        vim.o.guifont = "FiraCode Nerd Font Mono:h12"
    else
        vim.o.guifont = "FiraCode Nerd Font Mono 12" -- Linux/macOS style
    end

    vim.g.neovide_cursor_vfx_mode = "pixiedust" 
    vim.g.neovide_cursor_vfx_particle_density = 20.0
    vim.g.neovide_opacity = 0.7 
    vim.g.neovide_window_blurred = true
    vim.g.neovide_floating_blur_amount_x = 2.0
    vim.g.neovide_floating_blur_amount_y = 2.0
    
    vim.o.winblend = 30
    vim.o.pumblend = 30
end

-- Background Killer (Biar beneran tembus ke wallpaper)
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local hl_groups = {
      "Normal", "NormalFloat", "NormalNC", "NvimTreeNormal", 
      "NeoTreeNormal", "NeoTreeNormalNC", "LineNr", "Folded", 
      "NonText", "SpecialKey", "VertSplit", "WinSeparator", "EndOfBuffer",
      "DashboardHeader", "DashboardFooter", "DashboardKey", "DashboardDesc", "DashboardIcon"
    }
    for _, group in ipairs(hl_groups) do
      vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
    end
  end,
})

-- Fitur Auto-Save ala PHPStorm
-- Dia bakal save otomatis kalau:
-- 1. Lu keluar dari Insert Mode (pencet Esc)
-- 2. Lu pindah window (FocusLost)
-- 3. Ada perubahan teks (TextChanged)
local autosave_group = vim.api.nvim_create_augroup("Autosave", { clear = true })

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged", "FocusLost" }, {
  group = autosave_group,
  pattern = "*",
  callback = function()
    -- Cek dulu: filenya ada isinya, bukan folder, dan emang ada perubahan
    if vim.bo.modified and vim.bo.buftype == "" and vim.fn.filereadable(vim.fn.expand("%")) == 1 then
      vim.cmd("silent! wall") -- 'wall' artinya save semua buffer yang kebuka
    end
  end,
})
