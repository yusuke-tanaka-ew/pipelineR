#' Create model
#'
#' Create model (add R srcipt & model info to mod.yaml)
#' @import usethis
#' @param processer_name Target processer name.
#' @param model_name Target model name.
#' @export 
#' @examples

model_create <- function(model_name,processer_name){
    # TODO Create model script
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
    ## TODO check mod.yaml & Add meta data to mod.yaml

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
