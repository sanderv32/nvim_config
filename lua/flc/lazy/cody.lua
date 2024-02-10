return {
    "sourcegraph/sg.nvim",
    dependencies = { "nvim-lua/plenary.nvim", --[[ "nvim-telescope/telescope.nvim ]] },
    config = function ()
        local sg = require("sg")
        sg.setup {
            enable_cody = true,
            event = "InsertEnter",
        }
    end
}
