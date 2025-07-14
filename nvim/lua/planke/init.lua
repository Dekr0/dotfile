local M = {}

---@class opts
---@field td               string 
---@field vim_improve      string
---@field workflow_improve string
---@field win_config       vim.api.keyset.win_config | nil

---@param str string
---@return function() -> string
local function splits(str, sep)
    return string.gmatch(str, '([^'..sep..']+)')
end

---@comment The following only work in Linux and maybe MacOS. Assume all 
--- environmental path doesn't end with "/"
---@param path string
---@return string
local function expand_path(path)
    local abs = false
    if string.sub(path, 1, 1) == "/" then
        abs = true
    end
    local paths = {}
    for split in splits(path, "%/") do
        if string.sub(split, 1, 1) == "$" and string.len(split) > 1 then
            if string.len(split) <= 1 then
                vim.notify(
                    "Invalid file path: " .. path .. ". There's an environmental variable only has $ symbol.",
                    vim.log.levels.ERROR
                )
                return ""
            end
            split = string.sub(split, 2)
            table.insert(paths, os.getenv(split))
        elseif string.sub(split, 1, 1) == "~" then
            table.insert(paths, os.getenv("HOME"))
        else
            table.insert(paths, split)
        end
    end
    local expanded = ""
    for i, _path in ipairs(paths) do
        if i == 1 then
            expanded = _path
        else
            expanded = expanded .. "/" .. _path
        end
    end
    if abs and string.sub(expanded, 1, 1) then
        expanded = "/" .. expanded
    end
    return expanded
end

---@param outer number
---@param inner number
local function center_in(outer, inner)
    return (outer - inner) / 2
end

---@return vim.api.keyset.win_config
local function win_config()
    -- min(80% of the screen, 64)
    local width = math.min(math.floor(vim.o.columns * 0.8), 64)
    local height = math.floor(vim.o.lines * 0.8)

    return {
        relative = "editor",
        width    = width,
        height   = height,
        col      = center_in(vim.o.columns, width),
        row      = center_in(vim.o.lines, height),
        border   = "single"
    }
end

---@param planke string
---@param file string
---@param win_conf vim.api.keyset.win_config | nil
local function open_planke_float(planke, file, win_conf)
    file = expand_path(file)

    if vim.fn.filereadable(file) == 0 then
        vim.notify(
            planke .. " file does not exist at directory: " .. file,
            vim.log.levels.ERROR
        )
        return
    end

    -- Load file content and put them in buffer
    local buf = vim.fn.bufnr(file, true)
    if buf == -1 then
        vim.notify(
            "Failed to load " .. " into the buffer",
            vim.log.levels.ERROR
        )
    end

    -- Disable swap file for this buffer
    vim.bo[buf].swapfile = false

    if win_conf == nil then
        vim.api.nvim_open_win(buf, true, win_config())
    else
        vim.api.nvim_open_win(buf, true, win_conf)
    end
end

---@param opts opts | nil
local function setup_user_commands(opts)
    if opts == nil then
        vim.notify(
            "No option is being provided. Plugin is disabled.",
            vim.log.levels.WARN
        )
        return
    end

    vim.api.nvim_create_user_command("Ptd", function()
        vim.notify("opening floating window...")
        open_planke_float("TODO", opts.td, nil)
    end, {})
    vim.api.nvim_create_user_command("Pvi", function()
        vim.notify("opening floating window...")
        open_planke_float("Vim Improvement", opts.vim_improve, nil)
    end, {})
    vim.api.nvim_create_user_command("Pwf", function()
        vim.notify("opening floating window...")
        open_planke_float("Workflow improvement", opts.workflow_improve, nil)
    end, {})
end

---@param opts opts | nil
M.setup = function(opts)
    setup_user_commands(opts)
end

return M
