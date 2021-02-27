#' Controll output data (Write)
#'
#' Controll output data. Write output data by output_data name & model name
#' @import rlist
#' @param x Target output data.
#' @param write_func How to save x. e.g) write.csv()
#' @param model_name Target model name.
#' @export 
#' @examples output_write(df_output,'mod_sapmple')

output_write <- function(x,model_name){
    ## TODO: Save output data @data/output/. File name is defined by model_name.
    output_name = 'default'
    if(class(x)=="data.frame"){
        output_name = paste('output_',model_name,'_',as.character(substitute(x)),'.csv',sep="")
        write.csv(x,paste('data/output/',output_name,sep=''),row.names=FALSE)
    }else{
        output_name = paste('output_',model_name,'_',as.character(substitute(x)),'.txt',sep="")
        writeLines(capture.output(x),paste('data/output/',output_name,sep=''))
    }
    if(output_name != 'default'){
        ## ADD METADATA
        meta_mod_output_add(model_name,output_name)
    }
}



## TODO THIS functio will be added after v1.0.0

output_read <- function(model_name){
    ## TODO : Read output data ,Return list is contains meta data of output & output files.
    
}
