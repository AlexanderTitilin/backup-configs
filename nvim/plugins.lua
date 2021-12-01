local iron = require('iron')
iron.core.set_config {
  preferred = {
    python = "ipython",
    scheme = "csi",
    javascript = "node",
    sicp = "racket",
    htdpbsl = "racket"
  }
}
