#' Create processer
#'
#' Create processer (Add processer script & model info to proc.yaml)
#' @import usethis
#' @import rlist
#' @param processer_name Target processer name.
#' @export 
#' @examples processer_crate('proc_sample')


processer_create <- function(processer_name){
    # Check Rscript & Create processer script
    if(paste(processer_name,'.R',sep="") %in% list.files('experiment/processer')){
        print(paste(processer_name,' already exists.',sep=""))
    }else{
        # Create processer R script.
        ## Load Template & insert processer_name
        write(template_proc_get(processer_name),paste('experiment/processer/',processer_name,'.R',sep=""))
        print(paste(processer_name,'.R is created.',sep=""))
    }
    # Add processer info to processer.yaml
    if(meta_proc_add(processer_name)){
        print('Creating processer Succeed!')
    }
}

#' Add proc meta data.
#'
#' Add proc meta data to proc.yaml   . If success to add, return TRUE, else FALSE.
#' @import usethis
#' @import rlist
#' @param processer_name Target processer name.
#' @export 
#' @examples meta_proc_add('proc_sample')

meta_proc_add <- function(processer_name){
    # TODO add meta data of new processer
    if(is.null(meta_proc_read(processer_name))){
        # Add new proc
        ## Create proc data
        input_default <- paste('input_',processer_name,'.csv',sep='')
        proc_tgt <- list(name=processer_name,description='Please write description here!',input=input_default)
        proc_all <- append(meta_proc_read(),list(proc_tgt))
        list.save(proc_all,'./experiment/proc.yaml')
        print('Processer meta data is added to experiment/proc.yaml. Please Add description!')
        return(TRUE)
    }else{
        # There is already proc meta data.
        print('There is proc meta data(proc.yaml) that has same name')
        return(FALSE)
    }
    
}

#' Read proc meta data.
#'
#' Read proc meta data. When processer_name is null ,return all proc meta data. With processer name return list of proc meta data,you can use {name,description,input}
#' @import usethis
#' @import rlist
#' @param processer_name Target processer name.
#' @export 
#' @examples meta_proc_read('proc_sample')

meta_proc_read <- function(processer_name = NULL){
    # Read meta data of processer & return meta data as list(if there is no data -> retutn NULL,if processer_name is null then return all metadata)
    proc_all <- list.load('./experiment/proc.yaml')
    if(is.null(processer_name)){
        return(proc_all)
    }else{
        proc_tgt <- list.first(list.filter(proc_all,name==processer_name))
        return(proc_tgt)
    }
}

