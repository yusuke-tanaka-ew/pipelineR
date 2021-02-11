#' Create project/processer/model (/experiment)
#'
#' Create project & manage experiment. 
#' @import usethis
#' @param project_name Target project name. 
#' @param processer_name Target processer name.
#' @param model_name Target model name.
#' @export 
#' @examples

create_proj <- function(project_name){
    # Create root dir
    dir.create(project_name)
    # Set working dir
    setwd(project_name)
    # Create sub dir
    dir.create('data')
    dir.create('data/raw')
    dir.create('data/input')
    dir.create('data/output')
    dir.create('data/report')
    dir.create('experiment')
    dir.create('experiment/processer')
    dir.create('experiment/models')
    dir.create('config')
    dir.create('sandbox')
    #  Create R project
    usethis::create_project('.')
    usethis::use_rstudio()
    # Remove R dir
    file.remove('R')
    # Create README & expr.yaml
    file.create('README.md')
    file.create('experiment/expr.yaml')
}

create_processer <- function(processer_name){
    # TODO Create processer script
}

create_model <- function(model_name,processer_name){
    # TODO Create model script
}
