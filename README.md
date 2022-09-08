## Text_matching


### Intstall library/framework
	pip3 install -r requirements.txt 
	pip3 install torch
### Training
``` bash
python3 train.py configs/main.json5
``` 

### Test
``` bash
python3 evaluate.py models/snli/benchmark-0/best.pt data/snli/train.txt 
```

### API
``` bash
uvicorn api:api --reload
```

### docker run api 
``` bash
docker run -d --name text_matching -p 8000:8000 thinhemb/text_matching
```

### Run api on chrome
copy link: http://127.0.0.1:8000/docs 
into chrome -> test api
