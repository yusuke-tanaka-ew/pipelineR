# pipelineR
Manage R analytics project.  

## Directory  

<pre>
.
├── README.md  
├── config  
├── data  
│   ├── garbage  
│   ├── input  
│   │   └── input_processer01.csv  
│   ├── output  
│   │   └── output_model01.csv  
│   ├── raw  
│   │   └── rawdata.csv  
│   └── report  
├── experiment  
│   ├── expr.yaml  
│   ├── models  
│   │   └── model01.R  
│   └── processer  
│       └── processer01.R  
├── sample.Rproj  
└── sandbox  
</pre>

## Command

* Create Project
Create project directory & Rproj file.

```
pipelineR::create_proj('project_name')
```
 
* Create processer
Create processer R script.  
This script contains base code.

```
pipelineR::create_processer('processer_name')
```
 
* Create model
Create model R script.  
This script contains base code.  

```
pipelineR::create_model('model_name','processer_name')
```
