return {
  { "ellisonleao/gruvbox.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
  {
    "echasnovski/mini.indentscope",
    setup = function()
      require("mini.indentscope").gen_animation.none()
    end,
  },
}
