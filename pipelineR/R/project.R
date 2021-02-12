#' Create project
#'
#' Create function (create directory & add files.) 
#' @import usethis
#' @param project_name Target project name. 
#' @export 
#' @examples

project_create <- function(project_name){
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
    file.create('experiment/proc.yaml')
    file.create('experiment/mod.yaml')
    # Print creating project info.
    print(paste('Succeed to create project : ',project_name,sep=""))
}
