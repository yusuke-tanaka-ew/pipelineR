# pipelineR
Manage R analytics project.  

## Directory  

<pre>
.
├── README.md  
├── config  
├── data  
│   ├── input  
│   │   └── input_processer01.csv  
│   ├── output  
│   │   └── output_model01.csv  
│   ├── raw  
│   │   └── rawdata.csv  
│   ├── report  
│   └── garbage  
├── experiment  
│   ├── expr.yaml  
│   ├── proc.yaml  
│   ├── mod.yaml  
│   ├── models  
│   │   └── model01_01.R  
│   └── processer  
│       └── processer01.R  
├── sample.Rproj  
└── sandbox  
</pre>

## Command

* Create Project  
Create project directory & Rproj file.

```
pipelineR::project_create('project_name')
```
 
* Create processer  
Create processer R script.  
This script contains base code.

```
pipelineR::processer_create('processer_name')
```
 
* Create model  
Create model R script.  
This script contains base code.  

```
pipelineR::model_create('model_name','processer_name')
```

## How to install?

* dev ver  
This is for develop version. After ver 0.0.5 , you can use prd ver.

1. Clone from github  
Select branch.  

```
git clone yusuke-tanaka-ew/pipelineR -b ver0.0.0
```

2. Install package from source file

```
install.packages('{file path}/pipelineR', repos = NULL, type="source")
```
