local iron = require('iron')
iron.core.set_config {
  preferred = {
    python = "ipython",
    scheme = "guile",
    javascript = "node"
  }
}
