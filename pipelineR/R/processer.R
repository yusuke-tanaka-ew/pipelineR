#' Create processer
#'
#' Create processer (Add processer script & model info to proc.yaml)
#' @import usethis
#' @param processer_name Target processer name.
#' @export 
#' @examples
#' @include template.R

# meta data location
meta_dir <- 'TODO NOW LOADING'


processer_create <- function(processer_name){
    # TODO Check Rscript & Create processer script
    if(paste(processer_name,'.R',sep="") %in% list.files('experiment/processer')){
        print(paste(processer_name,' already exists.',sep=""))
    }else{
        # Create processer R script.
        ## Load Template & insert processer_name
        write(template_proc_get(processer_name),paste(processer_name,'.R',sep=""))
        print(paste(processer_name,'.R is created.',sep=""))
    }
    # TODO add processer info to processer.yaml

}


proc_yaml_read <- function(processer_name){
    ## TODO read processer info from proc.yaml
}
