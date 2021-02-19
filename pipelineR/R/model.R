#' Create model
#'
#' Create model (add R srcipt & model info to mod.yaml)
#' @import usethis
#' @import rlist
#' @param processer_name Target processer name.
#' @param model_name Target model name.
#' @export 
#' @examples

model_create <- function(model_name,processer_name){
    # Check there is already model script
    if(paste(model_name,'.R',sep='') %in% list.files('experiment/models')){
        print('There is already model that has same name.')
    }else{
        write(template_mod_get(model_name,processer_name),paste('experiment/models/',model_name,'.R',sep=''))
        print(paste(model_name,'.R is created.',se=''))
    }
    # Add meta data to mod 
    if(meta_mod_add(model_name,processer_name)){
        print('Creating model successed!')
    }
}



#' Add meta data of model
#'
#' Add meta data of model to mod.yaml. If there is meta data of input model, function does nothing.
#' @import usethis
#' @param processer_name Target processer name.
#' @param model_name Target model name.
#' @export 
#' @examples

meta_mod_add <- function(model_name,processer_name){
    ## TODO check mod.yaml & Add meta data to mod.yaml . Return TURE or FALSE
    return(TRUE)
}



#' Read meta data of model
#'
#' Read meta data of model to mod.yaml. If model_name is NULL (default is NULL), return all model meta data as list.
#' @import usethis
#' @param processer_name Target processer name.
#' @param model_name Target model name.
#' @export 
#' @examples
meta_mod_read <- function(model_name=NULL){
    # TODO if model_name is null -> return all model meta data, if model_name is not null -> return meta data of model_name.
}


#' Add meta data of model's output.
#'
#' Add meta data of model's output to mod.yaml. If there is meta data of input model, or output, function does nothing.
#' @import usethis
#' @param model_name Target model name.
#' @param output_name Target output name.
#' @export 
#' @examples

meta_mod_output_add <- function(model_name,output_name){
    ## TODO check mod.yaml & Add meta data to mod.yaml

}
