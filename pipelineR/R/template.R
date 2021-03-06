template_proc_get <- function(processer_name){
    # read processer template & insert processer name
    template_proc <- "## This is processer tampate.
## processer_name is #processer_name#\n
# Section0. package
library(pipelineR)\n
# Section1. Read raw data\n\n
# Section2. Processing data\n\n
# Section3. Save
pipelineR::input_write(input_df,'#processer_name#')
    "
    template_proc <- gsub('#processer_name#',processer_name,template_proc)
    return(template_proc)
}


template_mod_get <- function(model_name,processer_name){
    # read model template & insert model name
    template_mod <- '
## This is model template.
## model name is #model_name#\n
# Section0. package
library(pipelineR)\n
# Section1. Read input data
df_input <- pipelineR::input_read(#proceser_name#)\n
# Section2. model \n\n
# Section3. Save TODO rewrite save function
pipelineR::output_write(output,#model_name#)
'
    template_mod <- gsub('#model_name#',model_name,template_mod)
    template_mod <- gsub('#processer_name#',processer_name,template_mod)
    return(template_mod)
}