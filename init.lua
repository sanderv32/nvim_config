local config_path = vim.fn.stdpath("config")
if not vim.loop.fs_stat(config_path.."/.git") then
    print(config_path.." doesn't exists, checking out")
    vim.fn.system({
        "git",
        "-C",
        config_path,
        "init"
    })
    vim.fn.system({
        "git",
        "-C",
        config_path,
        "remote",
        "add",
        "origin",
        "https://github.com/sanderv32/nvim_config.git",
    })
    vim.fn.system({
        "git",
        "-C",
        config_path,
        "reset",
        "--hard",
        "origin/lazy-vim"
    })
end

require("flc")
