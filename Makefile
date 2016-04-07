frozen-requirements.txt: requirements.txt
	pip install -r requirements.txt && \
	pip freeze | grep -Pv "setuptools|ores" > \
	frozen-requirements.txt

deployment_wheels: frozen-requirements.txt
	mkdir -p deployment_wheels && \
	pip wheel -r frozen-requirements.txt -w deployment_wheels
