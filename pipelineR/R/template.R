#' Controll template
#'
#' Controlle template of {processer/model}
#' @param processer_name Target processer name.
#' @param model_name Target model name.
#' @export 
#' @examples

## TODO CHECK! Can I read package dir or file. If cannnot read tex file

template_proc_get <- function(processer_name){
    # read processer template & insert processer name
    template_proc <- 'THIS IS TEMPLATE TEXT proc name is : processer_name !!!'
    template_proc <- sub('processer_name',processer_name,template_proc)
    return(template_proc)
}


template_mod_get <- function(model_name,processer_name){
    # read model template & insert model name
    template_mod <- 'THIS IS TEMPLATE TEXT. model name is : model_name ,proc name is : processer_name !!!'
    template_mod <- sub('model_name',model_name,template_mod)
    template_mod <- sub('processer_name',processer_name,template_mod)
    return(template_mod)
}