local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

local servers = {"sumneko_lua", "jsonls", "yamlls", "rust_analyzer", "taplo"}

lsp_installer.setup()

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

local opts = {}

for _, server in pairs(servers) do
    if server == "rust_analyzer" then
        require("rust-tools").setup {
            tools = {
                on_initialized = function()
                    vim.cmd [[
                autocmd BufEnter,CursorHold,InsertLeave,BufWritePost *.rs silent! lua vim.lsp.codelens.refresh()
                ]]
                end
            },
            server = {
                settings = {
                    ["rust-analyzer"] = {
                        lens = {
                            enable = true
                        },
                        checkOnSave = {
                            command = "clippy"
                        }
                    }
                }
            }
        }
        goto continue
    end

    lspconfig[server].setup(opts)
    ::continue::
end
