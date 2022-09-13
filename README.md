## Text_matching
Calculate the similarity between the two texts.
## Target
Calculate the similarity between the data fields of facebook and zalo

## Installation
### Using virtual environment(Ubuntu 20.04)

Install library/framework
```bash

pip3 install -r requirements.txt 
pip3 install torch
```
## Dataset SNLI

Download and unzip SNLI (pre-processed by Tay et al.) to data/orig.

Unzip all zip files in the "data/orig/SNLI" folder. (cd data/orig/SNLI && gunzip *.gz)

cd data && python prepare_snli.py

## Dataset SciTail
Download and unzip SciTail dataset to data/orig.

cd data && python prepare_scitail.py

## Dataset Quora
Download and unzip Quora dataset (pre-processed by Wang et al.) to data/orig.

cd data && python prepare_quora.py

## Dataset WikiQA
Download and unzip WikiQA to data/orig.

cd data && python prepare_wikiqa.py

Download and unzip evaluation scripts. Use the make -B command to compile the source files in qg-emnlp07-data/eval/trec_eval-8.0. 

Move the binary file "trec_eval" to resources/.


### docker build 
username: docker
```bash
docker build -t username/text_matching .

```

### Training service by command 
``` bash
python3 train.py configs/main.json5
``` 

### Test service by command 
``` bash
# data test
python3 evaluate.py models/snli/benchmark-0/best.pt data/snli/test.txt 
```

### Run service by command
``` bash
uvicorn api:api --reload
```

### Run service by docker
username: docker
``` bash
docker run -d --name text_matching -P username/text_matching
```

## Usage
### Format request

------------------
|Attribute|Type|Required|
|:-------:|:--:|:------:|
| Text1 | string | True |  
| Text2 | string | True | 
---------------------

#### Request Example

```json
 {
  	"Text1" : "I love reading books",
	"Text2" : "I hate reading books",
 }
```

### Format returned

------------------
|Attribute|Type|Required|Description|
|:-------:|:--:|:------:|:---------:|
| Similarities  |string | True | Similarity of data in percent|

------------------

#### Example result

```json
{
  "Similarities": "22.4%"
}
```
## File desctiption
```bash
	
├── api.py # run api model
├── configs #contains config data
│   ├── ablation.json5
│   ├── data
│   │   ├── quora.json5
│   │   ├── scitail.json5
│   │   ├── snli.json5
│   │   └── wikiqa.json5
│   ├── debug.json5
│   ├── default.json5
│   └── main.json5
├── data #contains .py file download data
│   ├── prepare_quora.py
│   ├── prepare_scitail.py
│   ├── prepare_snli.py
│   ├── prepare_wikiqa.py
│   ├── snli
│   │   ├── dev.txt
│   │   ├── test.txt
│   │   └── train.txt
│   └── test_api.txt
├── dockerfile
├── evaluate.py
├── figure.png
├── LICENSE
├── models #contains models
│   ├── snli
│   │   ├── benchmark-0
│   │   │   ├── args.json5
│   │   │   ├── best.pt
│   │   │   └── log.txt
│   │   ├── data_config.json5
│   │   ├── embedding.msgpack
│   │   ├── target_map.txt
│   │   └── vocab.txt
├── README.md
├── requirements.txt
├── src #contains modules of model
│   ├── evaluator.py
│   ├── __init__.py
│   ├── interface.py
│   ├── model.py
│   ├── modules 
│   │   ├── alignment.py
│   │   ├── connection.py
│   │   ├── embedding.py
│   │   ├── encoder.py
│   │   ├── fusion.py
│   │   ├── __init__.py
│   │   ├── pooling.py
│   │   └── prediction.py
│   ├── network.py
│   ├── trainer.py
│   └── utils
│       ├── __init__.py
│       ├── loader.py
│       ├── logger.py
│       ├── metrics.py
│       ├── params.py
│       ├── registry.py
│       └── vocab.py
├── test.py
└── train.py

```