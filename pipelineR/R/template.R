#' Controll template
#'
#' Controlle template of {processer/model}
#' @param processer_name Target processer name.
#' @param model_name Target model name.
#' @export 
#' @examples

template_path = '../template/'

template_proc_get <- function(processer_name){
    # read processer template & insert processer name
    template_proc <- readChar(paste(template_path,'template_processer.txt',sep=""),paste(template_path,'template_processer.txt',sep="")$size)
    template_proc <- sub('processer_name',processer_name,template_proc)
    return(template_proc)
}


template_mod_get <- function(model_name,processer_name){
    # read model template & insert model name
    template_mod <- readChar(paste(template_path,'template_model.txt',sep=""),paste(template_path,'template_model.txt',sep="")$size)
    template_mod <- sub('model_name',model_name,template_mod)
    template_mod <- sub('processer_name',processer_name,template_mod)
    return(template_mod)
}