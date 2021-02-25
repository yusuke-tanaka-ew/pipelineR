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
        ## TODO CHECK processer is exsist
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
    if(is.null(meta_mod_read(model_name))){
        ## Add new model meta data
        default_description <- 'You should add description.'
        mod_tgt <- list(name=model_name,description=default_description,processer=processer_name)
        mod_all <- meta_mod_read()
        list.save(append(mod_all,list(mod_tgt)),'./experiment/mod.yaml')
        return(TRUE)
    }else{
        print('There is alredy meta data.')
        return(FALSE)
    }
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
    # if model_name is null -> return all model meta data, if model_name is not null -> return meta data of model_name.
    mod_all <- list.load('./experiment/mod.yaml')
    if(is.null(model_name)){
        return(mod_all)
    }else{
        mod_tgt <- list.first(list.filter(mod_all,name==model_name))
        return(mod_tgt)
    }
}


#' Add meta data of model's output.
#'
#' Add meta data of model's output to mod.yaml. If there is meta data of input model, or output, function does nothing.
#' @import usethis
#' @param model_name Target model name.
#' @param output_file_name Target output name.
#' @export 
#' @examples

meta_mod_output_add <- function(model_name,output_file_name){
    ## TODO check mod.yaml & Add meta data to mod.yaml
    mod_tgt <- meta_mod_read(model_name)
    if(is.null(mod_tgt)){
        print('There is no meta data .Please check model name & ./experiment/mod.yaml')
    }else{
        # Checl output file is already exist.
        if(is.null(mod_tgt$output)){
            # Update mod.yaml 1. remove tgt 2. add new mod meta data 3. save it!
            meta_mod_output_add_execution(model_name,output_file_name)
        }else{
            if(is.null(list.first(list.filter(mod_tgt$output,output==output_file_name)))){
                meta_mod_output_add_execution(model_name,output_file_name)
            }else{
                print('No meta data is updated')
            }
        }
    }

}
meta_mod_output_add_execution <- function(model_name,output_file_name){
    mod_tgt <- meta_mod_read(model_name)
    mod_exclude <- list.exclude(meta_mod_read(),name==model_name)
    output_tgt <- list(output=output_file_name,description='You should update this description') 
    mod_tgt_upd <- append(list.remove(mod_tgt,'output'),list(output=append(mod_tgt$output,list(output_tgt))))
    list.save(append(mod_exclude,list(mod_tgt_upd)),'./experiment/mod.yaml')
    print('Output meta data is updated')
}


#' Read meta data of model's output.
#'
#' Read meta data of model's output to mod.yaml. If there is meta data of input model name or output, return NULL
#' @import usethis
#' @param model_name Target model name.
#' @export 
#' @examples

meta_mod_output_read <- function(model_name){
    mod_tgt <- meta_mod_read(model_name)
    if(is.null(mod_tgt)){
        return(NULL)
    }else{
        return(mod_tgt$output)
    }

}
