#' Controll input data : Save
#'
#' Controll input data. Save input data by processer name: file type is only csv.
#' @param processer_name Target processer name.
#' @export 
#' @examples input_write(df_input,'proc_sample')

input_write <- function(x,processer_name){
    ## Save input data @data/input/. File name is defined by proc meta file.
    print('Start to write df. If you want to write input with your method,you can get file name by meta_proc_read(processer_name)$input & write it to data/input/ !')
    meta_proc <- meta_proc_read(processer_name)
    if(is.null(meta_proc)){
        print(paste('there is not meta data of ',processer_name,'. Please check processer name & proc.yaml.',sep=''))
    }else{
        # save input data as csv
        path_input <- paste('data/input/',meta_proc$input,sep='')
        write.csv(x,path_input,row.names = FALSE)
        print(paste('Input data is saved. File path is ...',path_input,sep=''))
    }
    
}

#' Controll input data : read
#'
#' Controll input data. Read input data by processer name: file type is only csv.
#' @param processer_name Target processer name.
#' @export 
#' @examples input_read('proc_sample')
input_read <- function(processer_name){
    ## TODO: Load input data by processer name. Mainly called at model. input file name is defined at proc meta file.Return data.frame
    meta_proc <- meta_proc_read(processer_name)
    if(is.null(meta_proc)){
        print(paste('there is not meta data of ',processer_name,'. Please check processer name & proc.yaml.',sep=''))()
    }else{
        # read input data as csv
        path_input <- paste('data/input/',meta_proc$input,sep='')
        res <- tryCatch(
            {return(read.csv(path_input))},
            error = function(e){
                return(as.character(e))
            },
            warning = function(e){
                return(as.character(e))
            }
        )
        if(typeof(res)=='character'){
            ## Read input is failed.
            print(paste('Read input is failed. Error message is :',res,
            'If you want read input file with your method, you can get file name by meta_proc_read(processer_name)$input & write it to data/input/ !',sep=''))
        }else{
            print(paste('Return file is ...',path_input,sep=''))
            return(res)
        }
    }
}

