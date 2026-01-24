require("which-key").add({
    { "<leader>s", group = "[S]earch" },
    { "<leader>t", group = "[T]oggle" },
    { "<leader>l", group = "[L]SP" },
    { "<leader>g", group = "[G]it" },
    { "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
})
