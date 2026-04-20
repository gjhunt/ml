# ---
# jupyter:
#   jupytext:
#     text_representation:
#       extension: .R
#       format_name: percent
#       format_version: '1.3'
#       jupytext_version: 1.16.3
#   kernelspec:
#     display_name: R
#     language: R
#     name: ir
# ---

# %% vscode={"languageId": "r"}
library("optparse")
library('styler')
library('glue')

# %% vscode={"languageId": "r"}
option_list <- list(
  make_option(c("-f", "--file"),
    type = "character", default = "",
    help = "File for processing [default %default]", metavar = "character"
  ),
  make_option(c("-d", "--dry_run"),
    type = "character", default = "off",
    help = "Dry run (don't actually clean) [default %default]", metavar = "character"
  )
)
opt_parser <- OptionParser(option_list = option_list)
opt <- parse_args(opt_parser)

DRY_MODE <- opt$dry_run


# %% vscode={"languageId": "r"}
nb <- tools::file_path_sans_ext(opt$f)
tmp_R <- tempfile(fileext = ".R")

# %%
system(
  glue("jupytext {nb}.ipynb --output {tmp_R} --to R:percent"),
  ignore.stdout = TRUE,
  ignore.stderr = FALSE
)

# %% vscode={"languageId": "r"}
needs_style <- tryCatch({    
    out <- capture.output(
      res <- withCallingHandlers(
        style_file(glue("{tmp_R}"), dry = "fail"),
        message = function(m) invokeRestart("muffleMessage"),
        warning = function(w) invokeRestart("muffleWarning")
      )
    )

    FALSE
},error=function(e){
    TRUE
})

# %%
if(needs_style){
    
    if(DRY_MODE=='off'){
      cat(glue('styler: Styling {nb}.ipynb.\n\n'))
      out <- capture.output(
        res <- withCallingHandlers(
          style_file(glue('{tmp_R}'),dry=DRY_MODE),
          message = function(m) invokeRestart("muffleMessage"),
          warning = function(w) invokeRestart("muffleWarning")
        )
      )

      system(glue('jupytext --update {tmp_R} --to=ipynb --output {nb}.ipynb'),
              ignore.stdout = TRUE,
              ignore.stderr = FALSE
      )
    } else {
      cat(glue('DRY-RUN styler: Styling {nb}.ipynb.\n\n'))
    }
}

# %%
unlink(tmp_R)
