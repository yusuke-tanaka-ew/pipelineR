#' Create processer
#'
#' Create processer (Add processer script & model info to proc.yaml)
#' @import usethis
#' @param processer_name Target processer name.
#' @export 
#' @examples

processer_create <- function(processer_name){
    # TODO Check Rscript & Create processer script
    if(paste(processer_name,'.R',sep="") %in% list.files('experiment/processer')){
        print(paste(processer_name,' already exists.',sep=""))
    }else{
        # Create processer R script.
        ## Load Template & insert processer_name
        file.create(paste(processer_name,'.R',sep=""))

    }
    # TODO add processer info to processer.yaml

}
