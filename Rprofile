options(repos=structure(c(CRAN="http://cran.ism.ac.jp/")))
options(menu.graphics=FALSE)

## Pretty-print size of objects in workspace
## Source: http://stackoverflow.com/questions/1358003/tricks-to-manage-the-available-memory-in-an-r-session
.ls.objects <- function (pos = 1, pattern, order.by,
                        decreasing=FALSE, head=FALSE, n=5) {
    napply <- function(names, fn) sapply(names, function(x)
                                         fn(get(x, pos = pos)))
    names <- ls(pos = pos, pattern = pattern)
    obj.class <- napply(names, function(x) as.character(class(x))[1])
    obj.mode <- napply(names, mode)
    obj.type <- ifelse(is.na(obj.class), obj.mode, obj.class)
    obj.prettysize <- napply(names, function(x) {
                           capture.output(print(object.size(x), units = "auto")) })
    obj.size <- napply(names, object.size)
    obj.dim <- t(napply(names, function(x)
                        as.numeric(dim(x))[1:2]))
    vec <- is.na(obj.dim)[, 1] & (obj.type != "function")
    obj.dim[vec, 1] <- napply(names, length)[vec]
    out <- data.frame(obj.type, obj.size, obj.prettysize, obj.dim)
    names(out) <- c("Type", "Size", "PrettySize", "Rows", "Columns")
    if (!missing(order.by))
        out <- out[order(out[[order.by]], decreasing=decreasing), ]
    if (head)
        out <- head(out, n)
    out
}

# shorthand
lsos <- function(..., n=10) {
    .ls.objects(..., order.by="Size", decreasing=TRUE, head=TRUE, n=n)
}

# The .First function is called after everything else in .Rprofile is executed
.First <- function() {
  # Print a welcome message
  message("Welcome back ", Sys.getenv("USER"),"!\n","working directory is:", getwd())
}

# Always load the 'methods' package
library(methods)

# Load the devtools and colorout packages if in interactive mode
if (interactive()) {
  library(devtools)
  library(colorout)
}

options(prompt = paste(paste(Sys.info()[c("user", "nodename")], collapse = "@"),"[R] "))            # customize your R prompt with username and hostname in this format: user@hostname [R]
options(digits = 12)                                                                                # number of digits to print. Default is 7, max is 15
options(stringsAsFactors = FALSE)                                                                   # Disable default conversion of character strings to factors
options(show.signif.stars = FALSE)                                                                  # Don't show stars indicating statistical significance in model outputs
error <- quote(dump.frames("${R_HOME_USER}/testdump", TRUE))                                        # post-mortem debugging facilities
