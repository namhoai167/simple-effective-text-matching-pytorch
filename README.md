## Text_matching
Calculate the similarity between the two texts.
## Target
Calculate the similarity between the data fields of facebook and zalo

## Installation
### Ubuntu (Using virtual environment)

```base
# install python3
sudo apt-get install -y python3-pip python3-dev
# install library/framework
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
```base
docker build -t text_matching .

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

``` bash
docker run -d --name text_matching -P text_matching
```

## Usage
### Format send request to API

------------------
|Attribute|Type|Required|
|:-------:|:--:|:------:|
| Text1 | string | True |  
| Text2 | string | True | 
---------------------

#### Example Request

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
```base
	configs\				#contains config data
		data\
			quora.json5
			scitail.json5
			snli.json5
			wiki.json5
		ablation.json5
		debug.json5
		default.json5
		main.json5
	data\					#contains .py file download data
		prepare_quora.py
		preqare_scitail.py
		preqare_snli.py
		preqare_wiki_qa.py
		text_api.txt
	models\ 				#contains models
	src\		 			#contains modules of model
		modules\
			__init__.py
			alignment.py
			connection.py
			embedding.py
			encoder.py
			fusion.py
			pooling.py
			prediction.py
		utils\
			__init__.py
			loader.py
			logger.py
			metrics.py
			params.py
			registry.py
			vocab.py
		__init__.py
		evaluator.py
		interface.py
		model.py
		network.py
		trainer.py
	api.py					# run api model
	dockerfile
	evaluate.py
	README.md
	requirements.txt
	test.py
	train.py
```